From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 08:31:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20090124083123.F057F769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-24 08:31:22 +0000 (Sat, 24 Jan 2009)
New Revision: 24998

Log:
freetype: only depend on zlib if it is available

The dependency is only there so zlib gets built before freetype if it's
available (for shared configure cache)

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-01-24 06:44:17 UTC (rev 24997)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-01-24 08:31:22 UTC (rev 24998)
@@ -4,13 +4,14 @@
 #
 #############################################################
 FREETYPE_VERSION = $(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
+#"))
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-FREETYPE_DEPENDENCIES = uclibc pkgconfig zlib
+FREETYPE_DEPENDENCIES = uclibc pkgconfig $(if $(BR2_PACKAGE_ZLIB,zlib)
 
 $(eval $(call AUTOTARGETS,package,freetype))
 
