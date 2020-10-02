From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Oct 2020 22:40:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/powerpc-utils: bump to version 1.3.8
Message-ID: <20201002204050.2885027-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set --disable-werror which has been added with
https://github.com/ibm-power-utilities/powerpc-utils/commit/3d8a7f5e2e3b735570ab99bb3a340ff7e0c14841

https://github.com/ibm-power-utilities/powerpc-utils/blob/v1.3.8/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 5cf790aa87..8d0b10425b 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bb48758bca3b9d056141b522e700218ee4e814b517aadf5a01f53b970ad1d3c3  powerpc-utils-1.3.7.tar.gz
+sha256  4e3a21419863c08adde49f0795eff0fbfe4597ce82593fa5fe1f1177913fb7b9  powerpc-utils-1.3.8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 8697daf194..cd96435a78 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.7
+POWERPC_UTILS_VERSION = 1.3.8
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
@@ -13,12 +13,13 @@ POWERPC_UTILS_LICENSE_FILES = COPYING
 
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+POWERPC_UTILS_CONF_OPTS = --disable-werror
 
 ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),y)
 POWERPC_UTILS_DEPENDENCIES += librtas
-POWERPC_UTILS_CONF_OPTS = --with-librtas
+POWERPC_UTILS_CONF_OPTS += --with-librtas
 else
-POWERPC_UTILS_CONF_OPTS = --without-librtas
+POWERPC_UTILS_CONF_OPTS += --without-librtas
 endif
 
 $(eval $(autotools-package))
-- 
2.28.0
