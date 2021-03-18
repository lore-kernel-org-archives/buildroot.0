From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Mar 2021 23:11:52 +0100
Subject: [Buildroot] [PATCH v3 2/3] package/rpi-firmware: add option for the
 debug set of start/fixup boot files
In-Reply-To: <20210318221153.13618-1-ps.report@gmx.net>
References: <20210318221153.13618-1-ps.report@gmx.net>
Message-ID: <20210318221153.13618-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option for the debug set of start/fixup boot files.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch

Changes v2 -> v3:
  - adjust to one-assignment style
---
 package/rpi-firmware/Config.in       | 10 ++++++++++
 package/rpi-firmware/rpi-firmware.mk |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 424122d654..a1ad402228 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
 	  The cut-down set of files for versions Zero/1/2/3 (only
 	  features required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB
+	bool "rpi 0/1/2/3 (debug)"
+	help
+	  The debug set of files for versions Zero/1/2/3.
+
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 	bool "rpi 4 (default)"
 	help
@@ -53,6 +58,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
 	  The cut-down set of files for versions 4 (only features
 	  required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
+	bool "rpi 4 (debug)"
+	help
+	  The debug set of files for versions 4.
+
 config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	string "Patch to a file stored as boot/config.txt"
 	help
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 7905791d1d..0c06f2c80d 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -15,9 +15,11 @@ RPI_FIRMWARE_FILES = \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
-	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB), start4db.elf fixup4db.dat)
 
 define RPI_FIRMWARE_INSTALL_BIN
 	$(foreach f,$(RPI_FIRMWARE_FILES), \
-- 
2.30.2
