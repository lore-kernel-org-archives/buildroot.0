From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:50:43 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] linux: support
 uncompressed kernel on S390
Message-ID: <20210403072612.D258D80298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0be0cebb1826d3afe54ccb0367c8ccbca3ecc126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 63de5158537129ee52a078b470c25e78ec63573d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++++
 linux/linux.mk  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index a188d9dad6..fdfd22889e 100644
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
index a212f42c28..7114c8d20c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -110,6 +110,7 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_KERNEL_LZMA
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_KERNEL_LZO
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
 LINUX_DEPENDENCIES += host-openssl
