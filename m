From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:02:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822160222.89AF8A5D2D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:02:22 -0700 (Wed, 22 Aug 2007)
New Revision: 19651

Log:
- pass TARGET_CONFIGURE_ARGS


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 15:59:56 UTC (rev 19650)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:02:22 UTC (rev 19651)
@@ -181,10 +181,8 @@
 	cd $(@D)/$($(PKG)_SUBDIR) && \
 	rm -f config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		CXXFLAGS="$(TARGET_CXXFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		$($(PKG)_CONF_ENV) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$($(PKG)_CONF_ENV) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
