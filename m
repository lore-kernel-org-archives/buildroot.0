From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Fri, 10 Oct 2014 11:05:29 +0200
Subject: [Buildroot] [PATCH 1/1] grub2: modify kernel location to
	/boot/zImage
Message-ID: <1412931929-22989-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the location where buildroot install the image if requested,
so this should be the default search path for the bootloader.

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 boot/grub2/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub.cfg b/boot/grub2/grub.cfg
index 9ea5281..c8abbd3 100644
--- a/boot/grub2/grub.cfg
+++ b/boot/grub2/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /bzImage root=/dev/sda1 console=tty1
+	linux /boot/bzImage root=/dev/sda1 console=tty1
 }
-- 
2.1.1
