From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Wed, 24 Mar 2021 12:45:22 +0100
Subject: [Buildroot] [PATCH 1/1] linux: support uncompressed kernel
Message-ID: <20210324114522.285121-1-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables to build an uncompressed Linux kernel.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 linux/Config.in | 3 +++
 linux/linux.mk  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 3370162faa..c09f70c4ac 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -329,6 +329,9 @@ config BR2_LINUX_KERNEL_XZ
 config BR2_LINUX_KERNEL_ZSTD
 	bool "zstd compression"
 
+config BR2_LINUX_KERNEL_UNCOMPRESSED
+	bool "uncompressed"
+
 endchoice
 
 config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
diff --git a/linux/linux.mk b/linux/linux.mk
index 5e4b319cf1..1457228eb9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -111,6 +111,7 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_KERNEL_LZMA
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_KERNEL_LZO
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
 LINUX_DEPENDENCIES += host-openssl
-- 
2.26.3
