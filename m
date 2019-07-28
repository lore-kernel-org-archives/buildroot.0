From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 28 Jul 2019 15:50:18 +0200
Subject: [Buildroot] [PATCH 1/1] configs/atmel_sama5d27_som1: kernel needs
 host-openssl to build
Message-ID: <1564321818-4135-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit df7005975e5a8419918600b1fcac57799a0ff5da, the linux
configuration requires host-openssl to be built.

Fixes:

 https://gitlab.com/buildroot.org/buildroot/-/jobs/259847527

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index f1abf83..da4a0fa 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,lin
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_som1_ek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_ALSA_UTILS=y
 BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
-- 
2.7.4
