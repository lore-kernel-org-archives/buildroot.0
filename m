From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Sep 2015 07:26:15 -0300
Subject: [Buildroot] [PATCH 1/2] harfbuzz: bump to version 1.0.2
Message-ID: <1441103176-26110-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static fix patch upstream so dropped.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-fix-static-linking-with-icu-uc.patch      | 33 ----------------------
 package/harfbuzz/harfbuzz.hash                     |  4 +--
 package/harfbuzz/harfbuzz.mk                       |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch

diff --git a/package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch b/package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch
deleted file mode 100644
index dd64393..0000000
--- a/package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5752d3f17072aa97a056dc081e402f43e1a3ba32 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Wed, 22 Jul 2015 23:26:23 +0200
-Subject: [PATCH] fix static linking with icu-uc
-
-When linking test-unicode statically it needs $(ICU_LIBS)
-which contains all required flags.
-Especially -lstdc++.
-
-Fixes:
-http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- test/api/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/api/Makefile.am b/test/api/Makefile.am
-index 4ff14fa..314a09f 100644
---- a/test/api/Makefile.am
-+++ b/test/api/Makefile.am
-@@ -34,7 +34,7 @@ test_unicode_CPPFLAGS += $(GLIB_CFLAGS)
- endif
- if HAVE_ICU
- test_unicode_CPPFLAGS += $(ICU_CFLAGS)
--test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la
-+test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la $(ICU_LIBS)
- endif
- 
- 
--- 
-2.4.3
-
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index daf495c..a054d6e 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.1.tar.bz2.sha256
-sha256	32a1a7ad584a2f2cfba5c1d234d046c0521e86e7a21d403e15e89aa509ef0ea8	harfbuzz-1.0.1.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.2.tar.bz2.sha256
+sha256	beb3caf8654010fcdca61c810a3a7532237fc567ee4271deb674b5efbbe3b466	harfbuzz-1.0.2.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 1d10a94..b9e3e11 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.0.1
+HARFBUZZ_VERSION = 1.0.2
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.4.6
