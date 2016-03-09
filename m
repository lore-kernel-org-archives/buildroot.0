From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 20:46:35 -0300
Subject: [Buildroot] [PATCH] boot/grub2: add rootwait to default config
Message-ID: <1457567195-18182-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It doesn't hurt, and is useful for removable boot media like a pendrive
that may depend on usb enumeration and isn't available immediately.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/grub2/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub.cfg b/boot/grub2/grub.cfg
index c8abbd3..bd3e3f0 100644
--- a/boot/grub2/grub.cfg
+++ b/boot/grub2/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /boot/bzImage root=/dev/sda1 console=tty1
+	linux /boot/bzImage root=/dev/sda1 rootwait console=tty1
 }
-- 
2.4.10
