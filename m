From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Feb 2013 21:48:36 +0100
Subject: [Buildroot] [git commit] bump json-c to 0.10
Message-ID: <20130301101145.9628F9AACA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7988b0fda1ceaacd7b23b2b98065a537c3cd87c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this patch bumps json-c to version 0.10 and adapts the no-reentrant patch
to the new version.

Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/json-c/json-c-no-reentrant.patch |   16 +++++++---------
 package/json-c/json-c.mk                 |    4 ++--
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/json-c/json-c-no-reentrant.patch b/package/json-c/json-c-no-reentrant.patch
index a01181c..31343c0 100644
--- a/package/json-c/json-c-no-reentrant.patch
+++ b/package/json-c/json-c-no-reentrant.patch
@@ -8,26 +8,24 @@ patch to avoid having to autoreconfigure the package.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: b/Makefile.am
+Index: b/Makefile.am.inc
 ===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
+--- a/Makefile.am.inc
++++ b/Makefile.am.inc
+@@ -1,2 +1,2 @@
 -AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
 +AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE
  
- EXTRA_DIST = README.html README-WIN32.html config.h.win32 doc
- 
 Index: b/Makefile.in
 ===================================================================
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -219,7 +219,7 @@
+@@ -263,7 +263,7 @@
  top_build_prefix = @top_build_prefix@
  top_builddir = @top_builddir@
  top_srcdir = @top_srcdir@
 -AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
 +AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE
- EXTRA_DIST = README.html README-WIN32.html config.h.win32 doc
+ EXTRA_DIST = README.html README-WIN32.html config.h.win32 doc json-c.vcproj
+ SUBDIRS = . tests
  lib_LTLIBRARIES = libjson.la
- pkgconfigdir = $(libdir)/pkgconfig
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index ed4a6d0..a0b5cae 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.9
-JSON_C_SITE = http://oss.metaparadigm.com/json-c/
+JSON_C_VERSION = 0.10
+JSON_C_SITE = https://github.com/downloads/json-c/json-c
 JSON_C_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
