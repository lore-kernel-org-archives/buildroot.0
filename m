From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 16:01:32 +0200
Subject: [Buildroot] [git commit] linux: add 'Image' as the image name for
	aarch64
Message-ID: <20151005140259.2D86C81E7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55a6b6d0d189fbb91555aeebc054e0ae97d113a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On aarch64, the image name is always Image, so let's add support for
that.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

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
index c98459f..6c7ecfc 100644
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
