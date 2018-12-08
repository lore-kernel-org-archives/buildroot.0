From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:52:25 +0100
Subject: [Buildroot] [git commit] configs/aarch64_efi: Linux needs
 host-openssl to build
Message-ID: <20181208200042.6413B86C48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb0a46901c6f0146dc0dae41e8bee8300043cd2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux kernel builds fails with:

scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>

Because it needs host-openssl.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/131216892

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
