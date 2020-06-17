From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:16 +0200
Subject: [Buildroot] [PATCH v2 08/17] board/olpc/xo-1: enable JFFS2
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-9-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The XO-1 laptop has a NAND flash an firmware capable of reading JFFS2
from it. Enable JFFS2 kernel support so that we'll be able to create
images capable of booting from the internal flash.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
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
-- 
2.26.2
