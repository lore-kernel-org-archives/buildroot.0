From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jul 2019 22:41:52 +0200
Subject: [Buildroot] [git commit] configs/atmel_sama5d27_som1: kernel needs
 host-openssl to build
Message-ID: <20190728203958.8332580282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40947390faae4b9baf4a3dad0d9c3d995c100588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit df7005975e5a8419918600b1fcac57799a0ff5da, the linux
configuration requires host-openssl to be built.

Fixes:

 https://gitlab.com/buildroot.org/buildroot/-/jobs/259847527

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index f1abf83689..da4a0fa155 100644
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
