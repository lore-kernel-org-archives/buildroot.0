From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 10:29:27 -0400
Subject: [Buildroot] [PATCH 4/5] openssl: add libssl virtual package support.
In-Reply-To: <20170615142928.31927-1-aduskett@codeblue.com>
References: <20170615142928.31927-1-aduskett@codeblue.com>
Message-ID: <20170615142928.31927-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl can provide libssl.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/openssl/Config.in  | 3 +++
 package/openssl/openssl.mk | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index e08b648..4871f43 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_HAS_LIBSSL
 	help
 	  A collaborative effort to develop a robust, commercial-grade, fully
 	  featured, and Open Source toolkit implementing the Secure Sockets
@@ -13,6 +14,8 @@ config BR2_PACKAGE_OPENSSL
 
 if BR2_PACKAGE_OPENSSL
 
+config BR2_PACKAGE_PROVIDES_LIBSSL
+	default "openssl"
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	help
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 5f56b44..c028290 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -10,6 +10,7 @@ OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
+OPENSSL_PROVIDES = libssl
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
-- 
2.9.4
