From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Mar 2018 23:31:13 +0100
Subject: [Buildroot] [PATCH 1/1] safeclib: bump to version 03032018
Message-ID: <20180304223113.26164-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (applied upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Fix-install-when-HAVE_WCHAR-is-unset.patch | 50 ----------------------
 package/safeclib/safeclib.hash                     |  2 +-
 package/safeclib/safeclib.mk                       |  2 +-
 3 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch

diff --git a/package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch b/package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch
deleted file mode 100644
index c34002d24e..0000000000
--- a/package/safeclib/0001-Fix-install-when-HAVE_WCHAR-is-unset.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 5991f0d4b86c02a3d7739509b96815ccfa734be7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fabrice.fontaine@orange.com>
-Date: Mon, 18 Dec 2017 17:17:54 +0100
-Subject: [PATCH] Fix install when HAVE_WCHAR is unset
-
-Don't build WCSNORM_xxx man pages if HAVE_WHCAR is not set otherwise
-installation will fail as the wcsnorm_mode enum is not defined in
-safe_str_lib.h when SAFECLIB_DISABLE_WCHAR is set
-
-Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
----
- Makefile.am | 15 +++++++++------
- 1 file changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 31398d1..b7e65a5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -142,12 +142,6 @@ dist_man_MANS += \
- 	doc/man/man3/SAFE_STR_PASSWORD_MIN_LENGTH.3	\
- 	doc/man/man3/STRTOK_DELIM_MAX_LEN.3	\
- 	doc/man/man3/TMP_MAX_S.3	\
--	doc/man/man3/WCSNORM_FCC.3	\
--	doc/man/man3/WCSNORM_FCD.3	\
--	doc/man/man3/WCSNORM_NFC.3	\
--	doc/man/man3/WCSNORM_NFD.3	\
--	doc/man/man3/WCSNORM_NFKC.3	\
--	doc/man/man3/WCSNORM_NFKD.3	\
- 	doc/man/man3/abort_handler_s.3	\
- 	doc/man/man3/abort_handler_s.c.3	\
- 	doc/man/man3/asctime_s.3	\
-@@ -461,6 +455,15 @@ dist_man_MANS += \
- 	doc/man/man3/wprintf_s.c.3	\
- 	doc/man/man3/wscanf_s.3	\
- 	doc/man/man3/wscanf_s.c.3
-+if ENABLE_WCHAR
-+dist_man_MANS += \
-+	doc/man/man3/WCSNORM_FCC.3      \
-+	doc/man/man3/WCSNORM_FCD.3      \
-+	doc/man/man3/WCSNORM_NFC.3      \
-+	doc/man/man3/WCSNORM_NFD.3      \
-+	doc/man/man3/WCSNORM_NFKC.3     \
-+	doc/man/man3/WCSNORM_NFKD.3
-+endif
- CLEANFILES += Doxyfile doc/footer README.md
- 
- # avoid parallel doxygen
--- 
-2.7.4
-
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index 95a862eef0..2a6fe86a53 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9c09c6e9fc95207c7d45944f8b669f2454056bef2bbaef70c94ba3f81be1cbb2	safeclib-v09102017.tar.gz
+sha256	51f66832853322a4fbe677e196ab4c68317261829edb5e56725ed96a07ea50e6	safeclib-v03032018.tar.gz
 sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index b1aa25992c..e4aaa3ff57 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = v09102017
+SAFECLIB_VERSION = v03032018
 SAFECLIB_SITE = $(call github,rurban,safeclib,$(SAFECLIB_VERSION))
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
-- 
2.14.1
