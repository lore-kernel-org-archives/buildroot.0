From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 17:28:15 +0100
Subject: [Buildroot] [PATCH 1/3] linux: add 'Image' as the image name for
	aarch64
Message-ID: <1443976097-27522-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On aarch64, the image name is always Image, so let's add support for
that.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in | 4 ++++
 linux/linux.mk  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index bb4f86b..99c8a0e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -225,6 +225,10 @@ config BR2_LINUX_KERNEL_SIMPLEIMAGE
 	select BR2_LINUX_KERNEL_DTS_SUPPORT
 	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 
+config BR2_LINUX_KERNEL_IMAGE
+	bool "Image"
+	depends on BR2_aarch64
+
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"
 	depends on BR2_microblaze
diff --git a/linux/linux.mk b/linux/linux.mk
index bbcc54b..7515735 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -111,6 +111,8 @@ else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
 LINUX_IMAGE_NAME = cuImage.$(KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
 LINUX_IMAGE_NAME = simpleImage.$(KERNEL_DTS_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_IMAGE),y)
+LINUX_IMAGE_NAME = Image
 else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
 LINUX_IMAGE_NAME = linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
-- 
2.5.3
