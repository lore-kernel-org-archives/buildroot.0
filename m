From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2016 17:46:27 -0300
Subject: [Buildroot] [PATCH] boot/grub: add rootwait to default config
Message-ID: <1457642787-28168-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It doesn't hurt, and is useful for removable boot media like a pendrive
that may depend on usb enumeration and isn't available immediately.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/grub/menu.lst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub/menu.lst b/boot/grub/menu.lst
index a231f7e..9f14da7 100644
--- a/boot/grub/menu.lst
+++ b/boot/grub/menu.lst
@@ -13,4 +13,4 @@ background 	cccccc
 
 title Buildroot
 	root (hd0,0)
-	kernel /boot/bzImage rw root=/dev/sda1
+	kernel /boot/bzImage rw root=/dev/sda1 rootwait
-- 
2.4.10
