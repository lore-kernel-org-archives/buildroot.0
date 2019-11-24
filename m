From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Nov 2019 19:01:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix license
Message-ID: <20191124180157.32084-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GPL only applies to the C++ bindings, which are conditionally
enabled with BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1.

The COPYING.LIB is indeed the LGPL-2.0, but the source file for
libftdi1 states LGPL-2.1-only, see src/ftdi.c

The src/ftdi_stream.c also bears a notice of the MIT license, so the
library itself is under both LGPL-2.1-only and MIT.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libftdi1/libftdi1.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 014dd8401e..cce04ee5ca 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -9,14 +9,16 @@ LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = libusb
-LIBFTDI1_LICENSE = LGPL-2.0 (libftdi1), GPL-2.0 with exception (ftdipp1)
-LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
+LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
+LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
 LIBFTDI1_DEPENDENCIES += boost
 LIBFTDI1_CONF_OPTS += -DFTDIPP=ON
+LIBFTDI1_LICENSE += , GPL-2.0 with exception (ftdipp1)
+LIBFTDI1_LICENSE_FILES += COPYING.GPL
 else
 LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
 endif
-- 
2.24.0
