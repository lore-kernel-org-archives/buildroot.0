From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:30:08 +0100
Subject: [Buildroot] [git commit] package/openocd: depends on libftdi1
	instead of libftdi
Message-ID: <20150320224445.C205C81885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bdf592654164ec7331c4e377b079302ed6da0e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that, if both libftdi and libftdi1 are available, openocd will
prefer libftdi1, so does Buildroot. ;-)

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openocd/Config.in  |    8 ++++----
 package/openocd/openocd.mk |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 7c140c7..2db17fa 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -121,7 +121,7 @@ config BR2_PACKAGE_OPENOCD_PARPORT
 
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "FT2232 based devices (DEPRECATED)"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
@@ -135,7 +135,7 @@ config BR2_PACKAGE_OPENOCD_VPI
 
 config BR2_PACKAGE_OPENOCD_UBLASTER
 	bool "Altera USB-Blaster"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
@@ -176,7 +176,7 @@ config BR2_PACKAGE_OPENOCD_GW16012
 
 config BR2_PACKAGE_OPENOCD_PRESTO
 	bool "ASIX Presto Programmer"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
@@ -185,7 +185,7 @@ config BR2_PACKAGE_OPENOCD_PRESTO
 
 config BR2_PACKAGE_OPENOCD_OPENJTAG
 	bool "OpenJTAG Programmer"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index fd7e09f..3b76850 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -23,7 +23,7 @@ OPENOCD_CONF_OPTS = \
 # the dependencies they need.
 
 OPENOCD_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_LIBFTDI),libftdi) \
+	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
 	$(if $(BR2_PACKAGE_LIBHID),libhid)
