From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:32:38 +0100
Subject: [Buildroot] [git commit] board/minnowboard: grub.cfg: disable eudev
 network interface renaming
Message-ID: <20210131201228.B7F2186150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03c817553a2aa710b0c50d0497d78135b0db859e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So the normal DHCP-on-eth0 logic works for the graphical defconfig where
eudev is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/minnowboard/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/minnowboard/grub.cfg b/board/minnowboard/grub.cfg
index 206f734f13..1f75f4d7ca 100644
--- a/board/minnowboard/grub.cfg
+++ b/board/minnowboard/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /bzImage root=PARTLABEL=rootfs rootwait console=tty0 console=ttyS0,115200
+	linux /bzImage root=PARTLABEL=rootfs rootwait console=tty0 console=ttyS0,115200 net.ifnames=0
 }
