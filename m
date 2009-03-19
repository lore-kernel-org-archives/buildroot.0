From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 08:29:42 +0000 (UTC)
Subject: [Buildroot] svn commit: [25751] trunk/buildroot/package/pkgconfig
Message-ID: <20090319082942.C46E77763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 08:29:42 +0000 (Thu, 19 Mar 2009)
New Revision: 25751

Log:
pkgconfig: make sure host compile target isn't considered out of date

Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-19 07:29:30 UTC (rev 25750)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-19 08:29:42 UTC (rev 25751)
@@ -40,6 +40,7 @@
 
 $(PKGCONFIG_HOST_DIR)/.compiled: $(PKGCONFIG_HOST_DIR)/.configured
 	$(MAKE) -C $(@D)
+	touch $@
 
 $(PKGCONFIG_HOST_BINARY): $(PKGCONFIG_HOST_DIR)/.compiled
 	$(MAKE) -C $(<D) install
