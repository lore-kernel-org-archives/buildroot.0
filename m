From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Aug 2019 19:58:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: bump to version 5.2.1
Message-ID: <20190806175800.3731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch: documentation can be disabled through --disable-doc since
https://github.com/jemalloc/jemalloc/commit/702d76dbd03e4fe7347399e1e322c80102c95544

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../jemalloc/0001-Disable-documentation.patch | 29 -------------------
 package/jemalloc/jemalloc.hash                |  2 +-
 package/jemalloc/jemalloc.mk                  |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 package/jemalloc/0001-Disable-documentation.patch

diff --git a/package/jemalloc/0001-Disable-documentation.patch b/package/jemalloc/0001-Disable-documentation.patch
deleted file mode 100644
index a5f252cd70..0000000000
--- a/package/jemalloc/0001-Disable-documentation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b9113f8dc939dab775dbc64bae03b927f0679467 Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Sun, 2 Apr 2017 19:26:04 +0200
-Subject: [PATCH] Disable documentation
-
-As there is no option to disable documentation, update Makefile.in to
-skip it.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index e49a871..74a7541 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -383,7 +383,7 @@ done
- 
- install_doc: install_doc_html install_doc_man
- 
--install: install_bin install_include install_lib install_doc
-+install: install_bin install_include install_lib
- 
- tests_unit: $(TESTS_UNIT:$(srcroot)%.c=$(objroot)%$(EXE))
- tests_integration: $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%$(EXE))
--- 
-2.9.3
-
diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index 874c7c858d..5db53d0535 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 74be9f44a60d2a99398e706baa921e4efde82bf8fd16e5c0643c375c5851e3b4  jemalloc-5.2.0.tar.bz2
+sha256 34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6  jemalloc-5.2.1.tar.bz2
 sha256 94aa2caa98c25d942f58b956c71dba6a99ff98fc3a31cbc669fe2a4cd0268b53  COPYING
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index f4d64851bf..aedc1f04bf 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 5.2.0
+JEMALLOC_VERSION = 5.2.1
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
-- 
2.20.1
