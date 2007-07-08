From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 04:03:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dmraid
Message-ID: <20070708110345.6C8EFA4550@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 04:03:43 -0700 (Sun, 08 Jul 2007)
New Revision: 19027

Log:
- bump version and uninstall runlevel script. Closes #1366


Modified:
   trunk/buildroot/package/dmraid/dmraid.mk


Changeset:
Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2007-07-08 00:18:51 UTC (rev 19026)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2007-07-08 11:03:43 UTC (rev 19027)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DMRAID_VERSION=1.0.0.rc13
+DMRAID_VERSION=1.0.0.rc14
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_DIR:=$(BUILD_DIR)/dmraid/$(DMRAID_VERSION)
@@ -51,7 +51,7 @@
 dmraid: uclibc dm zlib $(DMRAID_TARGET_BINARY)
 
 dmraid-clean:
-	rm $(DMRAID_TARGET_BINARY)
+	rm -f $(DMRAID_TARGET_BINARY) $(TARGET_DIR)/etc/init.d/dmraid
 	$(MAKE) -C $(DMRAID_DIR) clean
 
 dmraid-dirclean:
