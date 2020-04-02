From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  2 Apr 2020 23:45:49 +0200
Subject: [Buildroot] [PATCH 2/2] linux: adjust BR2_LINUX_KERNEL_IMAGE_NAME
 help text
In-Reply-To: <20200402214549.2977215-1-thomas.petazzoni@bootlin.com>
References: <20200402214549.2977215-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200402214549.2977215-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The help text of BR2_LINUX_KERNEL_IMAGE_NAME is somewhat incomplete,
in the sense that it assumes just a filename can be passed, while it
can be a relative path, such as 'compressed/vmlinux.bin.z'. So make it
clear that such paths are relative to arch/ARCH/boot/.

Also, drop the part about this being only useful for Xtensa as this is
not true: on MIPS it might be needed as well for some specific image
types.

Reported-by: Paul Cercueil <paul@crapouillou.net>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 86b5092b8a..ddf0264d33 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -338,10 +338,10 @@ config BR2_LINUX_KERNEL_IMAGE_NAME
 	string "Kernel image name"
 	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	help
-	  The filename of the kernel image, if it is different from the
-	  make target (above). Only Xtensa uses a filename different
-	  from the make target. Defaults to
-	  BR2_LINUX_KERNEL_IMAGE_TARGET_NAME.
+	  The filename of the kernel image, if it is different from
+	  the make target (above). Defaults to
+	  BR2_LINUX_KERNEL_IMAGE_TARGET_NAME. If specified, the
+	  filename is relative to arch/ARCH/boot/.
 
 	  If unsure, leave it empty.
 
-- 
2.25.1
