From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Aug 2019 09:24:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/gssdp: bump to version 1.0.3
In-Reply-To: <20190802072455.22212-1-fontaine.fabrice@gmail.com>
References: <20190802072455.22212-1-fontaine.fabrice@gmail.com>
Message-ID: <20190802072455.22212-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch to meson-package
- Disable examples (enabled by default)
- Disable introspection (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gssdp/gssdp.hash |  4 ++--
 package/gssdp/gssdp.mk   | 11 +++++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index acf6b3ab20..b389d0205c 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.2.sha256sum:
-sha256 a1e17c09c7e1a185b0bd84fd6ff3794045a3cd729b707c23e422ff66471535dc  gssdp-1.0.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.3.sha256sum:
+sha256 211387a62bc1d99821dd0333d873a781320287f5436f91e58b2ca145b378be41  gssdp-1.0.3.tar.xz
 
 # Hash for license file:
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index e7f3ad9330..4589517691 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -5,19 +5,22 @@
 ################################################################################
 
 GSSDP_VERSION_MAJOR = 1.0
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.0+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
+GSSDP_CONF_OPTS = \
+	-Dexamples=false \
+	-Dintrospection=false
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 GSSDP_DEPENDENCIES += libgtk3
-GSSDP_CONF_OPTS += --with-gtk
+GSSDP_CONF_OPTS += -Dsniffer=true
 else
-GSSDP_CONF_OPTS += --without-gtk
+GSSDP_CONF_OPTS += -Dsniffer=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.20.1
