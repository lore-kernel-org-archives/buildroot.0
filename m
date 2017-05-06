From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 May 2017 23:26:17 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: fix unmet dependencies
Message-ID: <20170506212617.27587-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, vcdbg is only supported in 32-bit mode. Furthermore, vcdbg
needs rpi-userland, which we currently only support in 32-bit mode.

Add a dependency on BR2_arm.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/rpi-firmware/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 4efef8691e..a7fa1c3b33 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -67,6 +67,7 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	bool "vcdbg"
+	depends on BR2_arm # rpi-userland
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
 	select BR2_PACKAGE_RPI_USERLAND
@@ -74,6 +75,7 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	  Install vcdbg, to help debug communication with the GPU.
 
 comment "vcdbg needs a glibc toolchain w/ C++"
+	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
 
 endif # BR2_PACKAGE_RPI_FIRMWARE
-- 
2.11.0
