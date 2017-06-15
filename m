From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 10:25:29 -0400
Subject: [Buildroot] [PATCH] libressl: add libssl virtual package support.
In-Reply-To: <20170615142531.31629-1-aduskett@codeblue.com>
References: <20170615142531.31629-1-aduskett@codeblue.com>
Message-ID: <20170615142531.31629-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libressl can provide libssl.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libressl/Config.in   | 4 ++++
 package/libressl/libressl.mk | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 035176a..2cc87d0 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
+	select BR2_PACKAGE_HAS_LIBSSL
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
@@ -10,6 +11,9 @@ config BR2_PACKAGE_LIBRESSL
 
 if BR2_PACKAGE_LIBRESSL
 
+config BR2_PACKAGE_PROVIDES_LIBSSL
+	default "libressl"
+
 config BR2_PACKAGE_LIBRESSL_BIN
 	bool "openssl binary"
 	help
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 940ca22..e057662 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -10,6 +10,7 @@ LIBRESSL_SITE_METHOD = git
 LIBRESSL_LICENSE = ISC, BSD-3-Clause, OpenSSL or SSLeay
 LIBRESSL_LICENSE_FILES = COPYING
 LIBRESSL_INSTALL_STAGING = YES
+LIBRESSL_PROVIDES = libssl
 
 # autogen.sh needs to be ran manually as it pulls from the upstream
 # OpenBSD source which adds several directories to the source.
-- 
2.9.4
