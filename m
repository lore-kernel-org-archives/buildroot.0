From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  8 May 2018 13:44:01 +0300
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.23
Message-ID: <8f724478de642846964735c3f6341dacbc9a3eb0.1525776241.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use += for the SUDO_CONF_ENV conditional assignment to avoid override of
SUDO_CONF_ENV assignments that might be added in the future.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sudo/sudo.hash | 4 +++-
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 80448ff7928b..3f20ccb15e0f 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256 74c5746cd33a814e2431c39faf0d76f7f8a697379bd073862e3b156cf0d76368  sudo-1.8.21p2.tar.gz
+sha256 d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679  sudo-1.8.23.tar.gz
+# Locally calculated
+sha256 b6625a7b58e9469a7adfd1732960579a19fe84b3508030f9a31641283e2250b8  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 77a95bd65e8c..136b6c6915cc 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.21p2
+SUDO_VERSION = 1.8.23
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
@@ -45,7 +45,7 @@ SUDO_CONF_OPTS += --with-ldap
 # it will fail with "undefined reference" errors.
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_OPENSSL),yy)
 SUDO_DEPENDENCIES += host-pkgconf
-SUDO_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
+SUDO_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
 endif
 else
 SUDO_CONF_OPTS += --without-ldap
-- 
2.17.0
