From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 09:59:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: fix NLS build
Message-ID: <20191226085938.2198391-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9e40a5b97dcd52cdfbd11688426ecad70390d56b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...l-AM_MKINSTALLDIRS-to-substitute-MKI.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch

diff --git a/package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch b/package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch
new file mode 100644
index 0000000000..a8cf7eebcc
--- /dev/null
+++ b/package/quota/0002-configure.ac-call-AM_MKINSTALLDIRS-to-substitute-MKI.patch
@@ -0,0 +1,37 @@
+From 48fb73784875fa654f6179c5f71756d898a6b6f5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 26 Dec 2019 09:43:32 +0100
+Subject: [PATCH] configure.ac: call AM_MKINSTALLDIRS to substitute
+ @MKINSTALLDIRS@
+
+MKINSTALLDIRS is obsolete and doesn't get automatically called.
+
+Force call AM_MKINSTALLDIRS() macro to substitute every @MKINSTALLDIRS@
+occurence in *.in files.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/linuxquota/code/merge-requests/5]
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index e8e6412..268441f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -45,6 +45,11 @@ AC_CHECK_FUNC([nl_langinfo], [
+ AM_GNU_GETTEXT([external])
+ AM_GNU_GETTEXT_VERSION([0.12.1])
+ 
++# ========================
++# Substitute MKINSTALLDIRS
++# ========================
++AM_MKINSTALLDIRS()
++
+ AS_IF([test "$enable_nls" != "no"], [
+     enable_nls="yes"
+     AC_DEFINE([USE_GETTEXT], 1, [Use gettext to translate messages])
+-- 
+2.24.0
+
-- 
2.24.0
