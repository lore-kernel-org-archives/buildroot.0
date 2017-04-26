From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Apr 2017 23:39:53 +0200
Subject: [Buildroot] [PATCH v2 8/8] linux: new Image.gz format for aarch64
In-Reply-To: <20170426213953.14904-1-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
Message-ID: <20170426213953.14904-9-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Distributions such as Fedora use the Image.gz image format for aarch64
to be booted with grub. It exists in linux since v3.10.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
This was not in v1.
It is actually an independent patch from the rest of the grub2 changes
but is somewhat related as this is probably the image format to be used
with grub2 for aarch64.
---
 linux/Config.in | 4 ++++
 linux/linux.mk  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index b651152..9062c9f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -244,6 +244,10 @@ config BR2_LINUX_KERNEL_IMAGE
 	bool "Image"
 	depends on BR2_aarch64
 
+config BR2_LINUX_KERNEL_IMAGE_GZ
+	bool "Image.gz"
+	depends on BR2_aarch64
+
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"
 	depends on BR2_microblaze
diff --git a/linux/linux.mk b/linux/linux.mk
index e387c7d..a4d90be 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -147,6 +147,8 @@ else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
 LINUX_IMAGE_NAME = simpleImage.$(KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_IMAGE),y)
 LINUX_IMAGE_NAME = Image
+else ifeq ($(BR2_LINUX_KERNEL_IMAGE_GZ),y)
+LINUX_IMAGE_NAME = Image.gz
 else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
 LINUX_IMAGE_NAME = linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
-- 
2.9.3
