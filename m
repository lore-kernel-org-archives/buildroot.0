From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu,  5 Jul 2007 21:58:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070706045802.29DA2A60EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-05 21:58:01 -0700 (Thu, 05 Jul 2007)
New Revision: 19009

Log:
Remove more stuff during 'make distclean'.


Modified:
   trunk/buildroot/package/config/Makefile


Changeset:
Modified: trunk/buildroot/package/config/Makefile
===================================================================
--- trunk/buildroot/package/config/Makefile	2007-07-06 04:26:32 UTC (rev 19008)
+++ trunk/buildroot/package/config/Makefile	2007-07-06 04:58:01 UTC (rev 19009)
@@ -32,7 +32,8 @@
 	$(Q)rm -f $(clean-files)
 distclean: clean
 	$(Q)rm -f $(lxdialog) $(conf-objs) $(mconf-objs) $(kxgettext-objs) \
-		$(hostprogs-y) $(qconf-cxxobjs) $(qconf-objs) $(gconf-objs)
+		$(hostprogs-y) $(qconf-cxxobjs) $(qconf-objs) $(gconf-objs) \
+		mconf .depend
 
 FORCE:
 .PHONY: FORCE clean distclean
