From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Nov 2018 09:08:39 +0100
Subject: [Buildroot] [PATCH 2/3] configs/pc_x86_64_efi: needs host-openssl
 to build Linux
In-Reply-To: <20181127080840.19434-1-thomas.petazzoni@bootlin.com>
References: <20181127080840.19434-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181127080840.19434-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/125631916

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pc_x86_64_efi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index bc99ca755b..2a76f403df 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -35,6 +35,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
-- 
2.19.1
