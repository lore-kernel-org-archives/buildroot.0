From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 29 Jan 2018 14:18:32 +0100
Subject: [Buildroot] [PATCH] augeas: bump to version 1.10.1
Message-ID: <20180129131832.14055-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patches included in the version bump.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...missing-trailing-backslash-for-dump-LDADD.patch | 25 ----------------
 ...efile-do-not-force-static-linking-of-dump.patch | 33 ----------------------
 package/augeas/augeas.hash                         |  4 +--
 package/augeas/augeas.mk                           |  2 +-
 4 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
 delete mode 100644 package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch

diff --git a/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch b/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
deleted file mode 100644
index 82d7c892be..0000000000
--- a/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d506cf6c1567cbb0a762c04d9354ab1694a5ac05 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 11 Dec 2017 23:33:08 +0100
-Subject: [PATCH] Update Makefile.am
-
-Add missing trailing backslash for `dump_LDADD`.
-
-Backported from: d506cf6c1567cbb0a762c04d9354ab1694a5ac05
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- examples/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index 66ebcdf2..a19597bf 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -13,5 +13,5 @@ fadot_LDADD = $(top_builddir)/src/libfa.la $(GNULIB)
- 
- dump_sources = dump.c
- dump_LDFLAGS = -static
--dump_LDADD =  $(top_builddir)/src/libaugeas.la $(top_builddir)/src/libfa.la
-+dump_LDADD =  $(top_builddir)/src/libaugeas.la $(top_builddir)/src/libfa.la \
- 	          $(GNULIB)
diff --git a/package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch b/package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch
deleted file mode 100644
index fe83fa7af6..0000000000
--- a/package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c50b793f6ab17c192e048b4a06421be7c6381998 Mon Sep 17 00:00:00 2001
-From: David Lutterkort <lutter@watzmann.net>
-Date: Fri, 5 Jan 2018 14:48:15 -0800
-Subject: [PATCH] * examples/Makefile.am: do not force static linking of dump
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Forcing static linking of 'dump' was accidentally left in from some
-testing; there is no reason to force that specifically for dump.
-
-Thanks to J?rg Krause for reporting the issue and verifying the fix.
-
-Fixes https://github.com/hercules-team/augeas/issues/535
-
-Backported from: c50b793f6ab17c192e048b4a06421be7c6381998
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- examples/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index a19597bf..928eb517 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -12,6 +12,5 @@ fadot_SOURCES = fadot.c
- fadot_LDADD = $(top_builddir)/src/libfa.la $(GNULIB)
- 
- dump_sources = dump.c
--dump_LDFLAGS = -static
- dump_LDADD =  $(top_builddir)/src/libaugeas.la $(top_builddir)/src/libfa.la \
- 	          $(GNULIB)
diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index a256686983..46b99dd8fe 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://download.augeas.net/augeas-1.9.0.tar.gz.sig
-sha256  2b463d398cabc9b42747aa61d3e83ed6a93ce03d9074cf8e7a7bd3107a668343  augeas-1.9.0.tar.gz
+# http://download.augeas.net/augeas-1.10.1.tar.gz.sig
+sha256  52db256afab261d31cc147eaa1a71795a5fec59e888dfd0b65a84c7aacd6364d  augeas-1.10.1.tar.gz
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index 8a7f38ede4..c4b8b7e6c2 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.9.0
+AUGEAS_VERSION = 1.10.1
 AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
-- 
2.16.0
