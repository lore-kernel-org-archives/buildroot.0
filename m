From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 18:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: bump version to 2.6.50
Message-ID: <20170916165738.13959-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/xelerance/Openswan/commit/0d78578d7f64c433324aa83248d11bd38f91c971

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-uClibc-ng-is-compatible-to-glibc.patch    | 39 ----------------------
 package/openswan/openswan.hash                     |  2 +-
 package/openswan/openswan.mk                       |  4 +--
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch

diff --git a/package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch b/package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch
deleted file mode 100644
index aa4d0ede24..0000000000
--- a/package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0f7bf4706d2932aaa50904fc529a853c9f86478f Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 13 Feb 2017 22:18:11 +0100
-Subject: [PATCH] uClibc-ng is compatible to glibc
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-Pull-Request: https://github.com/xelerance/Openswan/pull/227
-
----
- linux/include/openswan.h | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/linux/include/openswan.h b/linux/include/openswan.h
-index e2c45a130..66b9d42b2 100644
---- a/linux/include/openswan.h
-+++ b/linux/include/openswan.h
-@@ -27,18 +27,6 @@
- #endif
- 
- /*
-- * When using uclibc, malloc(0) returns NULL instead of success. This is
-- * to make it use the inbuilt work-around.
-- * See: http://osdir.com/ml/network.freeswan.devel/2003-11/msg00009.html
-- */
--#ifdef __UCLIBC__
--# if !defined(__MALLOC_GLIBC_COMPAT__) && !defined(MALLOC_GLIBC_COMPAT)
--#  warning Please compile uclibc with GLIBC_COMPATIBILITY defined
--# endif
--#endif
--
--
--/*
-  * We've just got to have some datatypes defined...  And annoyingly, just
-  * where we get them depends on whether we're in userland or not.
-  */
--- 
-2.11.1
-
diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index 5929f8d190..805ab948fb 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c1605c96d3c3cf357cefea7622f3acbc7a02d6a3cebfb76979327b566084a5ea	openswan-2.6.46.tar.gz
+sha256 9a3eb041084c3ab125dd645c40e8f5563efe73e18a3881cf2ce3582001daafc5  openswan-2.6.50.tar.gz
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index d9628edd92..928eb9bb6f 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.46
-OPENSWAN_SITE = http://download.openswan.org/openswan
+OPENSWAN_VERSION = 2.6.50
+OPENSWAN_SITE = https://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
-- 
2.11.0
