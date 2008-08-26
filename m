From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:47:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20080826204713.149A03C851@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:47:12 -0700 (Tue, 26 Aug 2008)
New Revision: 23219

Log:
neon: fix compilation without xml support

webdav needs xml support, so disable it if no xml support is selected,
otherwise configure could get confused about a host xml2-config script.

Modified:
   trunk/buildroot/package/neon/neon.mk


Changeset:
Modified: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:09 UTC (rev 23218)
+++ trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:12 UTC (rev 23219)
@@ -21,5 +21,9 @@
 NEON_CONF_OPT+=--with-libxml2=no
 NEON_DEPENDENCIES+=expat
 endif
+ifeq ($(strip $(BR2_PACKAGE_NEON_NOXML)),y)
+# webdav needs xml support
+NEON_CONF_OPT+=--disable-webdav
+endif
 
 $(eval $(call AUTOTARGETS,package,neon))
