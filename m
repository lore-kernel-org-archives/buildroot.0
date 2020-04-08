From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 14:50:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] linux: adjust
 BR2_LINUX_KERNEL_IMAGE_NAME help text
Message-ID: <20200408123714.617168DE74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4f543620112fab462c5ed3434bb077fb15cd491
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ea044ee20c8b1a53cd75bc85e257674b8c106ee7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 72230f1a61..718b209335 100644
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
 
