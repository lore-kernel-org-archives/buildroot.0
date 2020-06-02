From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  2 Jun 2020 07:21:46 -0500
Subject: [Buildroot] [PATCH] package/libqmi: bump to 1.25.900
Message-ID: <20200602122146.9480-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the configure of the updated version there was a dependency
found on zlib and it tried to retrieve the archive.

 Library z found: NO
 Downloading zlib source from https://zlib.net/fossils/zlib-1.2.11.tar.gz
 output/build/libglib2-2.64.2/meson.build:1885:4: ERROR: could not get

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libqmi/Config.in   | 1 +
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index f1d111b7c9..95fcef32c2 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBQMI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_ZLIB
 	help
 	  libqmi is a glib-based library for talking to WWAN modems and
 	  devices which speak the Qualcomm MSM Interface (QMI) protocol.
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 197ea1c007..4c0c6975cc 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  c2121243b5da8bcffc8f6f5ca0d7217498f94fffd115883763282c68f255fde7  libqmi-1.24.10.tar.xz
+sha256  c7f51d2e94c05d48a1fa6647fdcffcf85abdabc81169fcf9d7c4e3b314712629  libqmi-1.25.900.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index cd7fafa42a..8a1ad5d270 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.24.10
+LIBQMI_VERSION = 1.25.900
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
 LIBQMI_INSTALL_STAGING = YES
 
-LIBQMI_DEPENDENCIES = libglib2
+LIBQMI_DEPENDENCIES = libglib2 zlib
 
 # we don't want -Werror
 LIBQMI_CONF_OPTS = --enable-more-warnings=no
-- 
2.17.1
