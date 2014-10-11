From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Oct 2014 14:55:20 +0200
Subject: [Buildroot] [git commit] grub2: modify kernel location to
	/boot/zImage
Message-ID: <20141011133202.99E45B1F50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5bd127857a786c63d133de8991d6ba11bb19df2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the location where buildroot install the image if requested,
so this should be the default search path for the bootloader.

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub.cfg |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
