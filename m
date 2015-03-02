From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:19 -0000
Subject: [Buildroot] [git commit] linux: get rid of avr32 specifics
Message-ID: <20150302222718.404BA807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67596b6b6e9cf0b94258f445cd71ae0944e451ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    2 +-
 linux/linux.mk  |    4 ----
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 28cb36e..95c847b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -174,7 +174,7 @@ choice
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
-		   BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64 || \
+		   BR2_powerpc || BR2_sh || BR2_sh64 || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
diff --git a/linux/linux.mk b/linux/linux.mk
index accc42e..fc90fc5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -141,11 +141,7 @@ LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
-ifeq ($(KERNEL_ARCH),avr32)
-LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
-else
 LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
-endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
 define LINUX_DOWNLOAD_PATCHES
