From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:29:36 +0100
Subject: [Buildroot] [git commit] boot/grub: add rootwait to default config
Message-ID: <20160310213529.86A008185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=929d91edee72e1c5d433563caa1e883c3ae3bfbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It doesn't hurt, and is useful for removable boot media like a pendrive
that may depend on usb enumeration and isn't available immediately.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
