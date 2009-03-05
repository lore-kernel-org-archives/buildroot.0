From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 21:38:32 +0000 (UTC)
Subject: [Buildroot] svn commit: [25561] trunk/buildroot/package/bind
Message-ID: <20090305213832.92F5E775EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 21:38:30 +0000 (Thu, 05 Mar 2009)
New Revision: 25561

Log:
bind: touch post-install stamp file

Modified:
   trunk/buildroot/package/bind/bind.mk


Changeset:
Modified: trunk/buildroot/package/bind/bind.mk
===================================================================
--- trunk/buildroot/package/bind/bind.mk	2009-03-05 19:42:42 UTC (rev 25560)
+++ trunk/buildroot/package/bind/bind.mk	2009-03-05 21:38:30 UTC (rev 25561)
@@ -36,6 +36,7 @@
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
 endif
 	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
+	touch $@
 
 $(BIND_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
