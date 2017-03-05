From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 16:37:05 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_sessreg: bump version
	to 1.1.1
Message-ID: <20170305154308.006D282270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6bc02f8c2a99bc80da3dd3f7ac014d8be9c044b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://cgit.freedesktop.org/xorg/app/sessreg/commit/?id=93f5d5abf6b214a4b36e00cd09174d24b2ed0a6d

Renumbered remaining patch.
Changed _SITE according to URL mentioned in upstream release note.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...he-preprocessor-when-generating-filenames.patch | 32 ----------------------
 ...h_wtmpx.patch => 0001-missing_path_wtmpx.patch} |  0
 package/x11r7/xapp_sessreg/xapp_sessreg.hash       |  4 +--
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |  4 +--
 4 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/0001-Pass-P-to-the-preprocessor-when-generating-filenames.patch b/package/x11r7/xapp_sessreg/0001-Pass-P-to-the-preprocessor-when-generating-filenames.patch
deleted file mode 100644
index 5c3e91a..0000000
--- a/package/x11r7/xapp_sessreg/0001-Pass-P-to-the-preprocessor-when-generating-filenames.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 93f5d5abf6b214a4b36e00cd09174d24b2ed0a6d Mon Sep 17 00:00:00 2001
-From: Stefan Dirsch <sndirsch@suse.de>
-Date: Wed, 9 Sep 2015 23:44:06 +0200
-Subject: [PATCH] Pass -P to the preprocessor when generating filenames for the
- manpage.
-
-Fixes build with GCC 5. Patch by Richard Biener <rguenther@suse.com>
-
-Tested-by: Matt Turner <mattst88@gmail.com>
-Signed-off-by: Matt Turner <mattst88@gmail.com>
-[Thomas: backport from upstream commit 93f5d5abf6b214a4b36e00cd09174d24b2ed0a6d]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- man/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/man/Makefile.am b/man/Makefile.am
-index 665ace5..2e5f146 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -9,7 +9,7 @@ SUFFIXES = .$(APP_MAN_SUFFIX) .man
- 
- AM_CPPFLAGS = -I$(top_builddir) -I$(top_srcdir)
- filenames.sed: filenames.sed.c
--	$(AM_V_GEN)$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
-+	$(AM_V_GEN)$(CPP) -P $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
- 	    $(AM_CPPFLAGS) $(CPPFLAGS) $(srcdir)/filenames.sed.c | \
- 	    $(SED) -n -e '/s|__/ p' -e '/^\/__/ p' > $@
- 
--- 
-2.6.3
-
diff --git a/package/x11r7/xapp_sessreg/0002-missing_path_wtmpx.patch b/package/x11r7/xapp_sessreg/0001-missing_path_wtmpx.patch
similarity index 100%
rename from package/x11r7/xapp_sessreg/0002-missing_path_wtmpx.patch
rename to package/x11r7/xapp_sessreg/0001-missing_path_wtmpx.patch
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
index 9c1a802..47495b2 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.hash
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002522.html
-sha256	551177657835e0902b5eee7b19713035beaa1581bbd3c6506baa553e751e017c	sessreg-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-February/002778.html
+sha256 78a76ae3f3f6a26547a34630d1b740f42344848b5fb6d7c9c7f7da255e35a6e1  sessreg-1.1.1.tar.bz2
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 08811c0..c6e9463 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.1.0
+XAPP_SESSREG_VERSION = 1.1.1
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
-XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SESSREG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SESSREG_LICENSE = MIT
 XAPP_SESSREG_LICENSE_FILES = COPYING
 XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
