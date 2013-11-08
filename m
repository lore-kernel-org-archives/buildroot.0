From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  7 Nov 2013 22:10:39 -0500
Subject: [Buildroot] [PATCH 1/1] libqrencode: select libpng only when tools
	are selected
Message-ID: <1383880239-2002-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated on the libqrencode web site, PNG (or SDL) is only
needed for the test and utility programs; the library itself
has no dependencies.

While we are here, remove spaces in the ifeq clause, to match
the examples in the buildroot manual.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libqrencode/Config.in      |    2 +-
 package/libqrencode/libqrencode.mk |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
index e8fc1d4..b866626 100644
--- a/package/libqrencode/Config.in
+++ b/package/libqrencode/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBQRENCODE
 	bool "libqrencode"
-	select BR2_PACKAGE_LIBPNG
 	help
 	  libqrencode is a C library for encoding data in a QR Code
 	  symbol, a kind of 2D symbology that can be scanned by handy
@@ -14,6 +13,7 @@ if BR2_PACKAGE_LIBQRENCODE
 
 config BR2_PACKAGE_LIBQRENCODE_TOOLS
 	bool "libqrencode tools"
+	select BR2_PACKAGE_LIBPNG
 	help
 	  Build command-line tools
 
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index e1f2362..d445763 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -7,15 +7,15 @@
 LIBQRENCODE_VERSION = 3.4.2
 LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
 LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
-LIBQRENCODE_DEPENDENCIES = libpng
 LIBQRENCODE_INSTALL_STAGING = YES
 LIBQRENCODE_LICENSE = LGPLv2.1+
 LIBQRENCODE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBQRENCODE_TOOLS),y)
-        LIBQRENCODE_CONF_OPT += --with-tools=yes
+LIBQRENCODE_CONF_OPT += --with-tools=yes
+LIBQRENCODE_DEPENDENCIES += libpng
 else
-        LIBQRENCODE_CONF_OPT += --with-tools=no
+LIBQRENCODE_CONF_OPT += --with-tools=no
 endif
 
 $(eval $(autotools-package))
-- 
1.7.9.5
