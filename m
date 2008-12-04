From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  4 Dec 2008 08:50:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081204165005.AB6F53C8FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-04 08:50:05 -0800 (Thu, 04 Dec 2008)
New Revision: 24276

Log:
qtopia4: make build verbose or silent depending on user input

This will make Qt compile silent unless the user specifies V=1 or VERBOSE=1
when running make.



Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-12-04 16:49:06 UTC (rev 24275)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-12-04 16:50:05 UTC (rev 24276)
@@ -326,7 +326,7 @@
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		./configure \
-		-verbose \
+		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
 		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
 		$(QTOPIA4_QCONFIG_COMMAND) \
