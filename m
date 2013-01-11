From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 11 Jan 2013 18:55:05 +0100
Subject: [Buildroot] [PATCH] rpi-firmware: Add default kernel name to
	config.txt
Message-ID: <1357926905-26350-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default name of the kernel binary for the RaspberryPi is kernel.img, it's a
only a zImage kernel renamed.
Since buildroot will build a zImage, the default config uses that should use it
instead of forcing the user to rename a file.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/rpi-firmware/config.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
index 2cabd68..da212c4 100644
--- a/package/rpi-firmware/config.txt
+++ b/package/rpi-firmware/config.txt
@@ -6,6 +6,7 @@
 
 arm_freq=700
 core_freq=250
+kernel='zImage'
 disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
-- 
1.7.10.4
