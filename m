From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:49:28 +0200
Subject: [Buildroot] [git commit] linux: support uncompressed kernel on S390
Message-ID: <20210328202448.6AFDE8A42B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63de5158537129ee52a078b470c25e78ec63573d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 4 ++++
 linux/linux.mk  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index d7bdf5e7d8..cf790963dd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -329,6 +329,10 @@ config BR2_LINUX_KERNEL_XZ
 config BR2_LINUX_KERNEL_ZSTD
 	bool "zstd compression"
 
+config BR2_LINUX_KERNEL_UNCOMPRESSED
+	bool "uncompressed"
+	depends on BR2_s390x
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
