From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Jan 2015 11:50:19 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.1
Message-ID: <1422370219-12126-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/0001-assume-get-certificate-ok.patch      | 17 +++++++++++++++++
 ...e-time_h.patch => 0002-missing-include-time_h.patch} |  0
 package/squid/squid-01-assume-get-certificate-ok.patch  | 16 ----------------
 package/squid/squid.hash                                |  6 +++---
 package/squid/squid.mk                                  |  4 ++--
 5 files changed, 22 insertions(+), 21 deletions(-)
 create mode 100644 package/squid/0001-assume-get-certificate-ok.patch
 rename package/squid/{squid-02-missing-include-time_h.patch => 0002-missing-include-time_h.patch} (100%)
 delete mode 100644 package/squid/squid-01-assume-get-certificate-ok.patch

diff --git a/package/squid/0001-assume-get-certificate-ok.patch b/package/squid/0001-assume-get-certificate-ok.patch
new file mode 100644
index 0000000..e26b50d
--- /dev/null
+++ b/package/squid/0001-assume-get-certificate-ok.patch
@@ -0,0 +1,17 @@
+The openssl get_certificate working test isn't cross compile friendly.
+Just assume it works ok since we're using a modern OpenSSL version.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura squid-3.5.1.orig/configure.ac squid-3.5.1/configure.ac
+--- squid-3.5.1.orig/configure.ac	2015-01-27 11:09:15.035711981 -0300
++++ squid-3.5.1/configure.ac	2015-01-27 11:09:25.829084482 -0300
+@@ -1342,7 +1342,7 @@
+     AC_DEFINE(USE_OPENSSL,1,[OpenSSL support is available])
+ 
+     # check for other specific broken implementations
+-    SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
++    #SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
+     SQUID_CHECK_OPENSSL_CONST_SSL_METHOD
+     SQUID_CHECK_OPENSSL_TXTDB
+     SQUID_CHECK_OPENSSL_HELLO_OVERWRITE_HACK
diff --git a/package/squid/squid-02-missing-include-time_h.patch b/package/squid/0002-missing-include-time_h.patch
similarity index 100%
rename from package/squid/squid-02-missing-include-time_h.patch
rename to package/squid/0002-missing-include-time_h.patch
diff --git a/package/squid/squid-01-assume-get-certificate-ok.patch b/package/squid/squid-01-assume-get-certificate-ok.patch
deleted file mode 100644
index 0f8d93e..0000000
--- a/package/squid/squid-01-assume-get-certificate-ok.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-The openssl get_certificate working test isn't cross compile friendly.
-Just assume it works ok since we're using a modern OpenSSL version.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura squid-3.3.8.orig/configure.ac squid-3.3.8/configure.ac
---- squid-3.3.8.orig/configure.ac	2013-07-26 08:57:50.177259534 -0300
-+++ squid-3.3.8/configure.ac	2013-07-26 08:57:55.997448040 -0300
-@@ -1265,7 +1265,6 @@
- AC_SUBST(SSLLIB)
- 
- if test "x$with_openssl" = "xyes"; then
--SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
- SQUID_CHECK_OPENSSL_CONST_SSL_METHOD
- SQUID_CHECK_OPENSSL_TXTDB
- fi
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index bc686c1..a067383 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.11.tar.xz.asc
-md5	e79ddb108d24823da8c1dbc0fc4a31fb	squid-3.4.11.tar.xz
-sha1	7de0949714cda4d3f19073aa846f00768a6f841b	squid-3.4.11.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.5.1.tar.xz.asc
+md5	b3c9d9726314c1136b7a4c06447db24b	squid-3.5.1.tar.xz
+sha1	a2b01afd33d1df3a234e1a5c3405d626f6cf0fb0	squid-3.5.1.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 0bf516f..deb9360 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).11
+SQUID_VERSION_MAJOR = 3.5
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).1
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.0.5
