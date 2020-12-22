From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 22 Dec 2020 18:11:49 +0100
Subject: [Buildroot] [PATCH] package/openldap: bump to version 2.4.56
Message-ID: <20201222171149.343164-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/openldap/0001-fix_cross_strip.patch |  2 +-
 package/openldap/0002-fix-bignum.patch      |  4 ++--
 package/openldap/openldap.hash              | 10 +++++-----
 package/openldap/openldap.mk                |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/openldap/0001-fix_cross_strip.patch b/package/openldap/0001-fix_cross_strip.patch
index ed4964e44..d9d6f9d50 100644
--- a/package/openldap/0001-fix_cross_strip.patch
+++ b/package/openldap/0001-fix_cross_strip.patch
@@ -44,7 +44,7 @@ diff -rupN openldap-2.4.40/clients/tools/Makefile.in openldap-2.4.40-br/clients/
 diff -rupN openldap-2.4.40/configure.in openldap-2.4.40-br/configure.in
 --- openldap-2.4.40/configure.in	2014-09-18 21:48:49.000000000 -0400
 +++ openldap-2.4.40-br/configure.in	2015-01-16 15:50:48.874816786 -0500
-@@ -669,6 +669,15 @@ if test -z "${AR}"; then
+@@ -668,6 +668,15 @@ if test -z "${AR}"; then
  	fi
  fi
  
diff --git a/package/openldap/0002-fix-bignum.patch b/package/openldap/0002-fix-bignum.patch
index d3dc88fc3..159ea8e22 100644
--- a/package/openldap/0002-fix-bignum.patch
+++ b/package/openldap/0002-fix-bignum.patch
@@ -15,7 +15,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
 --- openldap-2.4.40.orig/configure	2014-09-19 03:48:49.000000000 +0200
 +++ openldap-2.4.40/configure	2015-01-25 18:44:54.216879362 +0100
-@@ -23478,7 +23478,7 @@
+@@ -23431,7 +23431,7 @@
  
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
@@ -27,7 +27,7 @@ diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
 diff -durN openldap-2.4.40.orig/configure.in openldap-2.4.40/configure.in
 --- openldap-2.4.40.orig/configure.in	2014-09-19 03:48:49.000000000 +0200
 +++ openldap-2.4.40/configure.in	2015-01-25 18:44:37.628676446 +0100
-@@ -2367,7 +2367,7 @@
+@@ -2383,7 +2383,7 @@
  	AC_CHECK_HEADERS(openssl/crypto.h)
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 6790e8b7a..4908f6e69 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.50.md5
-md5  f9ed44ef373abed04c9e4c8586260f9e  openldap-2.4.50.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.50.sha1
-sha1  82f576e0d0d334e9e798d9de8936683546247bb9  openldap-2.4.50.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.56.md5
+md5  82a7dcf7aeaf95fdad16017c0ed9983a  openldap-2.4.56.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.56.sha1
+sha1  4c617b87bd50ef8d071e7deb7525af79b08d4910  openldap-2.4.56.tgz
 # Locally computed
-sha256  5cb57d958bf5c55a678c6a0f06821e0e5504d5a92e6a33240841fbca1db586b8  openldap-2.4.50.tgz
+sha256  25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0  openldap-2.4.56.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index a9e71be59..e44c958c4 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.50
+OPENLDAP_VERSION = 2.4.56
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.27.0
