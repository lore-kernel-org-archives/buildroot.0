From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Jun 2008 14:45:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080620214528.6642B3C7D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-20 14:45:27 -0700 (Fri, 20 Jun 2008)
New Revision: 22462

Log:
libxml2: strip libraries in TARGET_DIR

And cleanup libxml2.mk trailing whitespace while we're at it.


Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-06-20 21:45:21 UTC (rev 22461)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-06-20 21:45:27 UTC (rev 22462)
@@ -21,9 +21,12 @@
 		--with-gnu-ld --enable-shared \
 		--enable-static --enable-ipv6=no \
 		--without-debugging --without-python \
-		--without-threads $(DISABLE_NLS) 
+		--without-threads $(DISABLE_NLS)
 
+LIBXML2_DEPENDENCIES = uclibc
 
-LIBXML2_DEPENDENCIES = uclibc 
+$(eval $(call AUTOTARGETS,package,libxml2))
 
-$(eval $(call AUTOTARGETS,package,libxml2))
+$(LIBXML2_HOOK_POST_INSTALL):
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxml2*so*
+	touch $@
