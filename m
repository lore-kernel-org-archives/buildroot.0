From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Feb 2020 22:15:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: use system portaudio
 instead of bundled one
Message-ID: <20200203211559.2529379-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/Config.in   | 1 +
 package/libpjsip/libpjsip.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 727d2ec3d0..08594ff677 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBPJSIP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBSRTP
+	select BR2_PACKAGE_PORTAUDIO
 	help
 	  PJSIP is a free and open source multimedia communication
 	  library written in C language implementing standard based
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index e1c3b511e8..ecb71b0335 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -7,7 +7,7 @@
 LIBPJSIP_VERSION = 2.9
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = https://www.pjsip.org/release/$(LIBPJSIP_VERSION)
-LIBPJSIP_DEPENDENCIES = libsrtp
+LIBPJSIP_DEPENDENCIES = libsrtp portaudio
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_INSTALL_STAGING = YES
@@ -35,6 +35,7 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-ipp \
 	--disable-silk \
+	--with-external-pa \
 	--with-external-srtp
 
 # Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
-- 
2.24.1
