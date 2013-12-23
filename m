From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 23 Dec 2013 09:36:48 +0100
Subject: [Buildroot] [PATCH 2/2] package: add <PKG>_VERSION_MAJOR variable
In-Reply-To: <1387787808-8194-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1387787808-8194-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1387787808-8194-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/gutenprint/gutenprint.mk       |    5 +++--
 package/libmpd/libmpd.mk               |    5 +++--
 package/libusb-compat/libusb-compat.mk |    5 +++--
 package/libusb/libusb.mk               |    5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 0924cb6..fe424eb 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-GUTENPRINT_VERSION = 5.2.9
-GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
+GUTENPRINT_VERSION_MAJOR = 5.2
+GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).9
+GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-$(GUTENPRINT_VERSION_MAJOR)/$(GUTENPRINT_VERSION)
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPLv2+
 GUTENPRINT_LICENSE_FILES = COPYING
diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index 7df8c2a..882210c 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBMPD_VERSION = 11.8.17
-LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8
+LIBMPD_VERSION_MAJOR = 11.8
+LIBMPD_VERSION = $(LIBMPD_VERSION_MAJOR).17
+LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/$(LIBMPD_VERSION_MAJOR)
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 LIBMPD_LICENSE = GPLv2+
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 8f2726e..db02bc7 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBUSB_COMPAT_VERSION = 0.1.4
+LIBUSB_COMPAT_VERSION_MAJOR = 0.1
+LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).4
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
-LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
+LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-$(LIBUSB_COMPAT_VERSION_MAJOR)/libusb-compat-$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 68e44ec..99f571c 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBUSB_VERSION = 1.0.9
+LIBUSB_VERSION_MAJOR = 1.0
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).9
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
-LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
+LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-$(LIBUSB_VERSION_MAJOR)/libusb-$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPLv2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
-- 
1.7.9.5
