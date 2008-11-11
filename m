From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 11 Nov 2008 03:33:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20081111113345.68C223C95C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-11-11 03:33:45 -0800 (Tue, 11 Nov 2008)
New Revision: 23998

Log:
package/freetype/freetype.mk: Add zib to dependencies

Looking into adding a configure cache to the build (like the GIT buildroot version)
This means that freetype needs to know about zlib so make
sure it had it as a dependency.
Also remove install rule for staging as it matches default.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-11-11 11:05:57 UTC (rev 23997)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-11-11 11:33:45 UTC (rev 23998)
@@ -10,8 +10,7 @@
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = NO
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-FREETYPE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
-FREETYPE_DEPENDENCIES = uclibc pkgconfig
+FREETYPE_DEPENDENCIES = uclibc pkgconfig zlib
 
 $(eval $(call AUTOTARGETS,package,freetype))
 
