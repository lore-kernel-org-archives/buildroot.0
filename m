From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:37:44 +0200
Subject: [Buildroot] [git commit] shellinabox: convert patch to a Git
	formatted one
Message-ID: <20160804203840.1E444804C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99ed68487a83380cf00ba5c602746ada3f995bf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...kefile-disable-always-building-statically.patch | 26 ++++++++++++++++++++++
 .../shellinabox/0001-Makefile.am-fix-static.patch  | 15 -------------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/package/shellinabox/0001-Makefile-disable-always-building-statically.patch b/package/shellinabox/0001-Makefile-disable-always-building-statically.patch
new file mode 100644
index 0000000..2f2097e
--- /dev/null
+++ b/package/shellinabox/0001-Makefile-disable-always-building-statically.patch
@@ -0,0 +1,26 @@
+From c060e6f06a81ffa400266a6d0bfc58511265a16f Mon Sep 17 00:00:00 2001
+From: Olivier Singla <olivier.singla@gmail.com>
+Date: Thu, 4 Aug 2016 21:23:41 +0200
+Subject: [PATCH] Makefile: disable always building statically
+
+Signed-off-by: Olivier Singla <olivier.singla@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7b8e7ab..5c4c71e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -126,7 +126,7 @@ BUILT_SOURCES        = shellinabox/beep.h                                     \
+ 
+ shellinaboxd_LDADD   = liblogging.la                                          \
+                        libhttp.la
+-shellinaboxd_LDFLAGS = -static
++shellinaboxd_LDFLAGS =
+ ## Added this for compatibility with older versions of autoconf/automake
+ docdir               = ${datadir}/doc/${PACKAGE}
+ 
+-- 
+2.7.4
+
diff --git a/package/shellinabox/0001-Makefile.am-fix-static.patch b/package/shellinabox/0001-Makefile.am-fix-static.patch
deleted file mode 100644
index 0fadde0..0000000
--- a/package/shellinabox/0001-Makefile.am-fix-static.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Makefile: disable always building statically.
-
-Signed-off-by:  "Olivier Singla" <olivier.singla@gmail.com>
-
---- shellinabox-2.19/Makefile.am.orig	2016-07-03 20:46:42.655784211 -0400
-+++ shellinabox-2.19/Makefile.am	2016-07-03 20:46:50.582801842 -0400
-@@ -126,7 +126,7 @@
- 
- shellinaboxd_LDADD   = liblogging.la                                          \
-                        libhttp.la
--shellinaboxd_LDFLAGS = -static
-+shellinaboxd_LDFLAGS =
- ## Added this for compatibility with older versions of autoconf/automake
- docdir               = ${datadir}/doc/${PACKAGE}
- 
