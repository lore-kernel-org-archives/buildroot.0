From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:21:35 +0100
Subject: [Buildroot] [git commit] boot/grub2: add rootwait to default config
Message-ID: <20160310213529.777A08185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9284b4aa396adb5d0093d9e67fc1033decdd72d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It doesn't hurt, and is useful for removable boot media like a pendrive
that may depend on usb enumeration and isn't available immediately.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
