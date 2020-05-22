From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 20:54:23 +0200
Subject: [Buildroot] [git commit] package/dovecot: drop first patch
Message-ID: <20200522184539.215EF91C6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d7df70016d51c4813c77095705cf8a0e3e1c09e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

First patch is not needed since version 2.3.0 and
https://github.com/dovecot/core/commit/08259c1f206026ca9b9f4b4e97603943c6093def

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-byteorder.h-fix-uclibc-build.patch        | 32 ----------------------
 ...ream-Do-not-build-static-test-iostream-s.patch} |  0
 package/dovecot/dovecot.mk                         |  2 +-
 3 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/package/dovecot/0001-byteorder.h-fix-uclibc-build.patch b/package/dovecot/0001-byteorder.h-fix-uclibc-build.patch
deleted file mode 100644
index b6d3ed3ec0..0000000000
--- a/package/dovecot/0001-byteorder.h-fix-uclibc-build.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 902917880ca29f1007750a70cf46e7246b2d0a2a Mon Sep 17 00:00:00 2001
-From: Josef 'Jeff' Sipek <jeff.sipek@dovecot.fi>
-Date: Tue, 14 Nov 2017 06:01:21 +0100
-Subject: [PATCH] byteorder.h: fix uclibc build
-
-Patch suggested on upstream mailinglist:
-https://www.dovecot.org/pipermail/dovecot/2017-November/110019.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/lib/byteorder.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/lib/byteorder.h b/src/lib/byteorder.h
-index 2f5dc7c17..4ffe8da21 100644
---- a/src/lib/byteorder.h
-+++ b/src/lib/byteorder.h
-@@ -23,6 +23,11 @@
- #ifndef BYTEORDER_H
- #define BYTEORDER_H
- 
-+#undef bswap_8
-+#undef bswap_16
-+#undef bswap_32
-+#undef bswap_64
-+
- /*
-  * These prototypes exist to catch bugs in the code generating macros below.
-  */
--- 
-2.11.0
-
diff --git a/package/dovecot/0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch b/package/dovecot/0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
similarity index 100%
rename from package/dovecot/0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
rename to package/dovecot/0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 9f89ce6354..86e101d80a 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -14,7 +14,7 @@ DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
-# 0002-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
+# 0001-lib-ssl-iostream-Do-not-build-static-test-iostream-s.patch
 DOVECOT_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
 DOVECOT_DEPENDENCIES += host-gettext
