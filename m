From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 20:58:29 +0200
Subject: [Buildroot] [git commit] board/olpc/xo-1: enable JFFS2
Message-ID: <20200617190503.246C0814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6dbb0b09703fda789dd60ef51525aa94731071d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The XO-1 laptop has a NAND flash and firmware capable of reading JFFS2
from it. Enable JFFS2 kernel support so that we'll be able to create
images capable of booting from the internal flash.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olpc/xo-1/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 9f6731a5a5..63566e8b90 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -70,6 +70,7 @@ CONFIG_RESET_CONTROLLER=y
 CONFIG_GENERIC_PHY=y
 CONFIG_PROC_KCORE=y
 CONFIG_HUGETLBFS=y
+CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_WBUF_VERIFY=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_FS_XATTR=y
