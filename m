From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 23:16:32 +0200
Subject: [Buildroot] [git commit] u-boot: use spl/u-boot-spl.bin as default
	spl file
Message-ID: <20140529212159.320A79CE1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb9aac7539904ffbf7a34040f71fd3d92c5c257d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ever since u-boot introduced the generic spl support in u-boot 2012.10, the
default spl output file has been spl/u-boot-spl.bin and not u-boot-spl.bin,
so use that as a more sane default value.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1c77f6a..0f98d7f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -224,11 +224,11 @@ config BR2_TARGET_UBOOT_SPL
 
 config BR2_TARGET_UBOOT_SPL_NAME
 	string "U-Boot SPL target name"
-	default "u-boot-spl.bin"
+	default "spl/u-boot-spl.bin"
 	depends on BR2_TARGET_UBOOT_SPL
 	help
 	  This is the name of the SPL binary, generated during
-	  u-boot build. For most platform it is u-boot-spl.bin
+	  u-boot build. For most platform it is spl/u-boot-spl.bin
 	  but not always. It is MLO on OMAP for example.
 
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
