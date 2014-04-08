From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  8 Apr 2014 07:31:35 +0300
Subject: [Buildroot] [PATCH] openssl: bump to version 1.0.1g
Message-ID: <826e70d65bb00ee9b67931921462d0798e036e18.1396931495.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes highly critical CVE-2014-0160. See http://heartbleed.com .

Drop patch applied upstream.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openssl/openssl-003-quote-cc.patch | 21 ---------------------
 package/openssl/openssl.mk                 |  2 +-
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 package/openssl/openssl-003-quote-cc.patch

diff --git a/package/openssl/openssl-003-quote-cc.patch b/package/openssl/openssl-003-quote-cc.patch
deleted file mode 100644
index 2c035d917d0f..000000000000
--- a/package/openssl/openssl-003-quote-cc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From 9aef04d9baa0a4bb5b8db92e9ab93b0a857a7659 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 9 Jan 2014 20:08:04 -0300
-Subject: [PATCH] Makefile.org: enclose CC parameter passing in quotes
-
-The compiler invocation might contain a space like when using ccache.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura openssl-1.0.1f.orig/Makefile.org openssl-1.0.1f/Makefile.org
---- openssl-1.0.1f.orig/Makefile.org	2014-01-09 19:57:23.324040960 -0300
-+++ openssl-1.0.1f/Makefile.org	2014-01-09 20:11:23.821070726 -0300
-@@ -302,7 +302,7 @@
- 			FIPSLD_CC="$(CC)"; CC=$(FIPSDIR)/bin/fipsld; \
- 			export CC FIPSLD_CC FIPSLD_LIBCRYPTO; \
- 		fi; \
--		$(MAKE) -e SHLIBDIRS=crypto  CC=$${CC:-$(CC)} build-shared; \
-+		$(MAKE) -e SHLIBDIRS=crypto  CC="$${CC:-$(CC)}" build-shared; \
- 		touch -c fips_premain_dso$(EXE_EXT); \
- 	else \
- 		echo "There's no support for shared libraries on this platform" >&2; \
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 98a098cf853d..52abb46dafa3 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1f
+OPENSSL_VERSION = 1.0.1g
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
1.9.1
