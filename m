From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2018 18:07:26 +0100
Subject: [Buildroot] [PATCHv2] configs/aarch64_efi: needs host-{dosfstools,
 mtools}
Message-ID: <20181209170726.11543-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    https://gitlab.com/ymorin/buildroot/-/jobs/131924126

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v1 -> v2:
  - add mtools too  (Thomas)
---
 configs/aarch64_efi_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index ecc050fc5e..e87193218e 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -32,3 +32,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Host tools for genimage
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.14.1
