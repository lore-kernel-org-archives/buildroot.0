From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:28:33 +0200
Subject: [Buildroot] [git commit] package/linknx: fix build without cppunit
Message-ID: <20190422202352.E301681E03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=febf8609900ef8ca733583f38605a5951ac8b962
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4b042b7e18425690ec26b4977865516bedcb9edb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-configure.ac-always-define-CPPUNIT.patch  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch b/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
new file mode 100644
index 0000000000..158bad9e9f
--- /dev/null
+++ b/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
@@ -0,0 +1,34 @@
+From 1b4a770af42f7d33ad174524b94ea4d2fc7133da Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Apr 2019 19:31:50 +0200
+Subject: [PATCH] configure.ac: always define CPPUNIT
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4b042b7e18425690ec26b4977865516bedcb9edb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/linknx/linknx/pull/42]
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 779fd6f..51d8ae6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -145,8 +145,11 @@ if test x"$WITH_CPPUNIT" != xno; then
+       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
+       AC_SUBST(CPPUNIT_CFLAGS)
+       AC_SUBST(CPPUNIT_LIBS)
+-    ])
++      AM_CONDITIONAL([CPPUNIT], true)
++    ],[AM_CONDITIONAL([CPPUNIT], false)])
+   fi
++else
++  AM_CONDITIONAL([CPPUNIT], false)
+ fi
+ 
+ dnl #########################################################################
+-- 
+2.20.1
+
