From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jul 2020 23:12:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/enchant: bump to version 2.2.8
Message-ID: <20200725211201.866021-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update site to get latest version
- Update hash of COPYING.LIB (update in FSF address with
  https://github.com/AbiWord/enchant/commit/adcb08292d4650a1c258f9b02c53cf1e26b47185)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/enchant/Config.in    | 2 +-
 package/enchant/enchant.hash | 5 ++---
 package/enchant/enchant.mk   | 5 +++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 86b2fade8f..4a39d03f86 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_ENCHANT
 	  Enchant is a spell-checking library that provides a consistent
 	  API across a number of spell-checking system backends.
 
-	  http://www.abisource.com/projects/enchant/
+	  https://abiword.github.io/enchant/
 
 comment "enchant needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
index f5709f08ee..5485444519 100644
--- a/package/enchant/enchant.hash
+++ b/package/enchant/enchant.hash
@@ -1,4 +1,3 @@
-# From http://www.abisource.com/downloads/enchant/1.6.0/MD5SUM
-md5	de11011aff801dc61042828041fb59c7	enchant-1.6.0.tar.gz
 # locally computed
-sha256  d0db934167997c8b8c863af297b3653aa98500bca0a7c05e9c6ec0dabf4f67d4  COPYING.LIB
+sha256  c7b5e2853f0dd0b1aafea2f9e071941affeec3a76df8e3f6d67a718c89293555  enchant-2.2.8.tar.gz
+sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING.LIB
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 69402c1af7..4465b38885 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 1.6.0
-ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
+ENCHANT_VERSION = 2.2.8
+ENCHANT_SITE = \
+	https://github.com/AbiWord/enchant/releases/download/v$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_DEPENDENCIES = libglib2 host-pkgconf
 ENCHANT_LICENSE = LGPL-2.1+
-- 
2.27.0
