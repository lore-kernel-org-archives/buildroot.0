From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 Sep 2020 08:17:52 +0200
Subject: [Buildroot] [PATCH v2,
 2/3] package/zeromq: add support for openpgm 5.3
In-Reply-To: <20200902061753.3668480-1-fontaine.fabrice@gmail.com>
References: <20200902061753.3668480-1-fontaine.fabrice@gmail.com>
Message-ID: <20200902061753.3668480-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re.ac-fix-build-with-openpgm-5-3-128.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/zeromq/0002-configure.ac-fix-build-with-openpgm-5-3-128.patch

diff --git a/package/zeromq/0002-configure.ac-fix-build-with-openpgm-5-3-128.patch b/package/zeromq/0002-configure.ac-fix-build-with-openpgm-5-3-128.patch
new file mode 100644
index 0000000000..89ef555714
--- /dev/null
+++ b/package/zeromq/0002-configure.ac-fix-build-with-openpgm-5-3-128.patch
@@ -0,0 +1,41 @@
+From 883d432c29fe5b81b2b4a6809610c60083571fb4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Sep 2020 07:54:36 +0200
+Subject: [PATCH] configure.ac: fix build with openpgm-5-3-128
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zeromq/libzmq/pull/4027]
+---
+ configure.ac | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e7193423..49b5d69c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -649,13 +649,18 @@ AC_ARG_WITH([pgm], [AS_HELP_STRING([--with-pgm],
+ 
+ # conditionally require pgm package
+ if test "x$with_pgm_ext" != "xno"; then
+-    PKG_CHECK_MODULES([pgm], [openpgm-5.2 >= 5.2], [
++    PKG_CHECK_MODULES([pgm], [openpgm-5.3 >= 5.3], [
+         have_pgm_library="yes"
+-        PKGCFG_NAMES_PRIVATE="$PKGCFG_NAMES_PRIVATE openpgm-5.2 >= 5.2"
++        PKGCFG_NAMES_PRIVATE="$PKGCFG_NAMES_PRIVATE openpgm-5.3 >= 5.3"
+     ], [
+-        PKG_CHECK_MODULES([pgm], [openpgm-5.1 >= 5.1], [
++        PKG_CHECK_MODULES([pgm], [openpgm-5.2 >= 5.2], [
+             have_pgm_library="yes"
+-            PKGCFG_NAMES_PRIVATE="$PKGCFG_NAMES_PRIVATE openpgm-5.1 >= 5.1"
++            PKGCFG_NAMES_PRIVATE="$PKGCFG_NAMES_PRIVATE openpgm-5.2 >= 5.2"
++        ], [
++            PKG_CHECK_MODULES([pgm], [openpgm-5.1 >= 5.1], [
++                have_pgm_library="yes"
++                PKGCFG_NAMES_PRIVATE="$PKGCFG_NAMES_PRIVATE openpgm-5.1 >= 5.1"
++            ])
+         ])
+     ])
+ fi
+-- 
+2.28.0
+
-- 
2.28.0
