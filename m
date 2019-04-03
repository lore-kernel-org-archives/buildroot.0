From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Wed, 3 Apr 2019 06:14:32 +0000
Subject: [Buildroot] [PATCH] gnutls: security bump to 3.6.7.1
Message-ID: <20190403061405.27273-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

 * CVE-2019-3836: It was discovered in gnutls before version 3.6.7 upstream
   that there is an uninitialized pointer access in gnutls versions 3.6.3 or
   later which can be triggered by certain post-handshake messages

 * CVE-2019-3829: A vulnerability was found in gnutls versions from 3.5.8
   before 3.6.7. A memory corruption (double free) vulnerability in the
   certificate verification API. Any client or server application that
   verifies X.509 certificates with GnuTLS 3.5.8 or later is affected.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 1af0e2d45d..e6bf7faaa9 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz.sig
-sha256	bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7	gnutls-3.6.6.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.7.1.tar.xz.sig
+sha256	881b26409ecd8ea4c514fd3fbdb6fae5fab422ca7b71116260e263940a4bbbad	gnutls-3.6.7.1.tar.xz
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index c6d2d72771..e7c5968204 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7.1
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-- 
2.20.1
