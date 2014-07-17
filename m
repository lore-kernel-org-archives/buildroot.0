From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 17 Jul 2014 17:29:23 +0200
Subject: [Buildroot] [PATCHv3 1/2] linux: add option to
	explicitlyspecify the kernel image name : breaks kernel build !
In-Reply-To: <8464FBE548EF40ECA03DD045E23F1D39@JohanW7>
References: <20140711124922.GA25220@waldemar-brodkorb.de>
 <8464FBE548EF40ECA03DD045E23F1D39@JohanW7>
Message-ID: <D5A9AA060AA94EDA827C2219FEFFDD4D@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

If BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
then LINUX_TARGET_NAME is undefined.

LINUX_TARGET_NAME is used on lines 266 (linux/linux.mk) and 341 to build the kernel.


Regards Johan


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Sagaert Johan
Verzonden: donderdag 17 juli 2014 1:02
Aan: 'Waldemar Brodkorb'
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCHv3 1/2] linux: add option to explicitlyspecify the kernel image name

Hi

I have uImage selected as kernel format,but the actual image build is zImage....
Rsulting in a build failure.
(commit c78d57637cd57a383e44713eb27e654b3071340e )

>>> linux 3.15.5 Installing to target
install -m 0644 -D /home/buildroot12git/output/build/linux-3.15.5/arch/arm/boot/uImage
/home/buildroot12git/output/target/boot/uImage
install: cannot stat `/home/buildroot12git/output/build/linux-3.15.5/arch/arm/boot/uImage': No such file or directory



===============================================================================================
BR2_arm=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.15.5"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
BR2_UCLIBC_CONFIG="$(TOPDIR)/board/Apex/msi_003/uClibc-0.9.33.config"
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
# BR2_UCLIBC_INSTALL_UTILS is not set
BR2_BINUTILS_VERSION_2_23_2=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_ECLIPSE_REGISTER=y
BR2_TARGET_GENERIC_HOSTNAME="sms_003"
BR2_TARGET_GENERIC_ISSUE="Apex TX28 Linux"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ROOTFS_DEVICE_TABLE="$(TOPDIR)/system/device_table.txt"
BR2_TARGET_GENERIC_ROOT_PASSWD="1234"
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_ROOTFS_OVERLAY="$(TOPDIR)/board/Apex/msi_003/overlay_SMSTX28"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/post.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.5"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/Apex/msi_003/tx28-linux-3.14.x.config"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(TOPDIR)/board/Apex/msi_003/imx28-tx28.dts"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_BUSYBOX_CONFIG="$(TOPDIR)/board/Apex/msi_003/busybox-1.22.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DIGITAL_IO=y
BR2_DIGITAL_IO_VERSION_CUSTOM=y
BR2_DIGITAL_IO_VERSION_CUSTOM_NAME="TX28_V102"
BR2_PACKAGE_GZIP=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_MKFSUBIFS=y
BR2_PACKAGE_GNUPLOT=y
BR2_PACKAGE_RRDTOOL=y
BR2_PACKAGE_EUDEV_RULES_GEN=y
BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_LIBGCRYPT=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_JQUERY_MOBILE=y
BR2_PACKAGE_JQUERY_MOBILE_FULL=y
BR2_PACKAGE_JQUERY_MOBILE_DEMOS=y
BR2_PACKAGE_LIBCGI=y
BR2_PACKAGE_LIBSOUP=y
BR2_PACKAGE_LIBUPNP=y
BR2_PACKAGE_LIBWEBSOCKETS=y
BR2_PACKAGE_QDECODER=y
BR2_PACKAGE_LIBESMTP=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_EZ_IPUPDATE=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NTP_NTPDATE=y
BR2_PACKAGE_RPCBIND=y
BR2_PACKAGE_INOTIFY_TOOLS=y
BR2_PACKAGE_TIME=y
BR2_PACKAGE_KMOD_TOOLS=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="tx28-apex"
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.karo-electronics.de/karo-tx-uboot.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="KARO-TX-2014-06-04"
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/karo/tx28/apex-extra-uboot-patches_karo"
BR2_TARGET_UBOOT_FORMAT_SB=y
BR2_PACKAGE_HOST_E2FSPROGS=y
BR2_PACKAGE_HOST_GENEXT2FS=y


Regards Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Waldemar Brodkorb
Verzonden: vrijdag 11 juli 2014 14:49
Aan: buildroot at buildroot.org
Onderwerp: [Buildroot] [PATCHv3 1/2] linux: add option to explicitly specify the kernel image name

For example the upcoming qemu-xtensa patch is using this feature, where the target is called "zImage", but the resulting kernel name
is "Image.elf".

---
Changes v2 -> v3:
  - improve subject (suggested by Thomas P.)
  - LINUX_IMAGE_NAME defaults to LINUX_TARGET_NAME (suggested by Yann)
  - improve help text (suggested by Yann) Changes v1 -> v2:
  - add comment about default value (suggested by Arnout)
  - reorder default value for LINUX_TARGET_NAME (suggested by Arnout)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 linux/Config.in |   10 ++++++++++
 linux/linux.mk  |   10 +++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in index 0a13b13..c13b929 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -244,6 +244,16 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_IMAGE_NAME
+	string "Kernel image name"
+	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
+	help
+	  The filename of the kernel image, if it is different from the
+	  make target (above). Only Xtensa uses a filename different from
+	  the make target. Defaults to BR2_LINUX_KERNEL_IMAGE_TARGET_NAME.
+
+	  If unsure, leave it empty.
+
 config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
 	string "load address (for 3.7+ multi-platform image)"
 	depends on BR2_arm || BR2_armeb
diff --git a/linux/linux.mk b/linux/linux.mk index bd3f2ac..d7e8390 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -80,7 +80,8 @@ endif
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
-LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
+LINUX_TARGET_NAME = $(call
+qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 LINUX_IMAGE_NAME = uImage
@@ -106,6 +107,9 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)  LINUX_IMAGE_NAME = vmlinuz  endif  endif
+ifeq ($(LINUX_IMAGE_NAME),)
+LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME) endif
 
 LINUX_KERNEL_UIMAGE_LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
 ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
@@ -259,7 +263,7 @@ endif
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
+$(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
@@ -332,7 +336,7 @@ endif
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed
$(BINARIES_DIR)/rootfs.cpio
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
+$(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
--
1.7.10.4

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
