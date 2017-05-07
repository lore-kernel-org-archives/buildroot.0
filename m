From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 21:41:31 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: fix unmet
	dependencies
Message-ID: <20170507194152.E8A6981EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db4c811b9e2cc47523aac75db7ed0282382a87c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, vcdbg is only supported in 32-bit mode. Furthermore, vcdbg
needs rpi-userland, which we currently only support in 32-bit mode.

Add a dependency on BR2_arm.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 4efef86..a7fa1c3 100644
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
