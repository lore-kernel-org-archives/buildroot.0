From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Feb 2014 15:21:47 -0300
Subject: [Buildroot] [PATCH] openswan: security bump to version 2.6.40
Message-ID: <1393352507-8841-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-6466.
openswan-wno-error-cpp.patch is no longer required since it's now
conditional on a check for a modern enough compiler.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openswan/openswan-wno-error-cpp.patch | 29 ---------------------------
 package/openswan/openswan.mk                  |  2 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 package/openswan/openswan-wno-error-cpp.patch

diff --git a/package/openswan/openswan-wno-error-cpp.patch b/package/openswan/openswan-wno-error-cpp.patch
deleted file mode 100644
index 8e79ae9..0000000
--- a/package/openswan/openswan-wno-error-cpp.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Kill -Wno-error=cpp, old(ish) gcc versions (< 4.4) don't like it and we still
-got 4.3.x available for internal toolchains.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura openswan-2.6.39.orig/lib/libopenswan/Makefile openswan-2.6.39/lib/libopenswan/Makefile
---- openswan-2.6.39.orig/lib/libopenswan/Makefile	2013-06-11 07:22:50.228520267 -0300
-+++ openswan-2.6.39/lib/libopenswan/Makefile	2013-06-11 07:27:40.087849447 -0300
-@@ -86,7 +86,7 @@
- CFLAGS+= -Wno-error=cast-qual
-
- # some junk left in alg_info.c
--CFLAGS+= -Wno-error=cpp
-+#CFLAGS+= -Wno-error=cpp
-
- #CFLAGS+= -Wmissing-declarations
- CFLAGS+= -Wstrict-prototypes
-diff -Nura openswan-2.6.39.orig/programs/pluto/Makefile openswan-2.6.39/programs/pluto/Makefile
---- openswan-2.6.39.orig/programs/pluto/Makefile	2013-06-11 07:22:49.753504978 -0300
-+++ openswan-2.6.39/programs/pluto/Makefile	2013-06-11 07:27:53.020265681 -0300
-@@ -47,7 +47,7 @@
-
- # must turn this off due to myid.c
- CFLAGS+= -Wno-error=cast-qual
--CFLAGS+= -Wno-error=cpp
-+#CFLAGS+= -Wno-error=cpp
-
- ifeq ($(HAVE_BROKEN_POPEN),true)
- CFLAGS+=-DHAVE_BROKEN_POPEN
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 0b8e7d3..ae055d4 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.39
+OPENSWAN_VERSION = 2.6.40
 OPENSWAN_SITE = http://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
-- 
1.8.3.2
