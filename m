From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 23:35:16 +0200
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2016.07
Message-ID: <20160714102605.E549B7FBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2009f9e7887b3dd66aa3bb187276caa9c44ebed4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Make-FIT-support-really-optional.patch    | 31 +++++++---------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 3 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
index 5404e4f..3ba5389 100644
--- a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
+++ b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
@@ -17,17 +17,19 @@ following changes:
   image-host.o common/image-fit.o to CONFIG_FIT=y, in tools/Makefile.
 
 Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+[fabio: adapt for 2016.07]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
 ---
  common/bootm.c  | 2 ++
  include/bootm.h | 2 ++
- tools/Makefile  | 6 ++----
- 3 files changed, 6 insertions(+), 4 deletions(-)
+ tools/Makefile  | 2 ++
+ 3 files changed, 6 insertions(+)
 
 diff --git a/common/bootm.c b/common/bootm.c
-index c965326..ab477ba 100644
+index 2431019..7e1adc8 100644
 --- a/common/bootm.c
 +++ b/common/bootm.c
-@@ -891,6 +891,7 @@ void memmove_wd(void *to, void *from, size_t len, ulong chunksz)
+@@ -901,6 +901,7 @@ void memmove_wd(void *to, void *from, size_t len, ulong chunksz)
  	memmove(to, from, len);
  }
  
@@ -35,7 +37,7 @@ index c965326..ab477ba 100644
  static int bootm_host_load_image(const void *fit, int req_image_type)
  {
  	const char *fit_uname_config = NULL;
-@@ -955,5 +956,6 @@ int bootm_host_load_images(const void *fit, int cfg_noffset)
+@@ -965,5 +966,6 @@ int bootm_host_load_images(const void *fit, int cfg_noffset)
  	/* Return the first error we found */
  	return err;
  }
@@ -57,7 +59,7 @@ index 4981377..94d62a1 100644
  int boot_selected_os(int argc, char * const argv[], int state,
  		     bootm_headers_t *images, boot_os_fn *boot_fn);
 diff --git a/tools/Makefile b/tools/Makefile
-index da50e1b..0a3d279 100644
+index f72294a..adf7c83 100644
 --- a/tools/Makefile
 +++ b/tools/Makefile
 @@ -54,6 +54,7 @@ mkenvimage-objs := mkenvimage.o os_support.o lib/crc32.o
@@ -68,7 +70,7 @@ index da50e1b..0a3d279 100644
  FIT_SIG_OBJS-$(CONFIG_FIT_SIGNATURE) := common/image-sig.o
  # Flattened device tree objects
  LIBFDT_OBJS := $(addprefix lib/libfdt/, \
-@@ -68,18 +69,15 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
+@@ -68,6 +69,7 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
  # common objs for dumpimage and mkimage
  dumpimage-mkimage-objs := aisimage.o \
  			atmelimage.o \
@@ -76,18 +78,5 @@ index da50e1b..0a3d279 100644
  			$(FIT_SIG_OBJS-y) \
  			common/bootm.o \
  			lib/crc32.o \
- 			default_image.o \
- 			lib/fdtdec_common.o \
- 			lib/fdtdec.o \
--			fit_common.o \
--			fit_image.o \
- 			gpimage.o \
- 			gpimage-common.o \
--			common/image-fit.o \
--			image-host.o \
- 			common/image.o \
- 			imagetool.o \
- 			imximage.o \
 -- 
-2.7.4
-
+1.9.1
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 2076b3b..cf27e90 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  87d02275615aaf0cd007b54cbe9fbadceef2bee7c79e6c323ea1ae8956dcb171  u-boot-2016.05.tar.bz2
+sha256  974fb7225c0af6a721307631f66b81e20dbda82a4d7cc32aba2a625727231253  u-boot-2016.07.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 4903f66..e7826bd 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2016.05
+UBOOT_TOOLS_VERSION = 2016.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
