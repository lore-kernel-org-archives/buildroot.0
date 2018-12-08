From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Dec 2018 16:01:30 +0100
Subject: [Buildroot] [PATCH] configs/aarch64_efi: Linux needs host-openssl
 to build
Message-ID: <20181208150130.4201-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux kernel builds fails with:

scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>

Because it needs host-openssl.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/131216892

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/aarch64_efi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index e4e20b09ba..ecc050fc5e 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -31,3 +31,4 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.19.2
