From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  8 Jul 2007 21:40:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hostap
Message-ID: <20070709044053.6AE9BA6884@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-08 21:40:53 -0700 (Sun, 08 Jul 2007)
New Revision: 19050

Log:
Use hostap release version instead of snapshot

Modified:
   trunk/buildroot/package/hostap/hostap.mk


Changeset:
Modified: trunk/buildroot/package/hostap/hostap.mk
===================================================================
--- trunk/buildroot/package/hostap/hostap.mk	2007-07-09 04:29:35 UTC (rev 19049)
+++ trunk/buildroot/package/hostap/hostap.mk	2007-07-09 04:40:53 UTC (rev 19050)
@@ -3,12 +3,13 @@
 # hostap
 #
 #############################################################
-HOSTAP_SOURCE_URL=http://hostap.epitest.fi/cgi-bin/viewcvs.cgi/hostap/hostap.tar.gz?tarball=1
-HOSTAP_SOURCE=hostap.tar.gz
-HOSTAP_DIR=$(BUILD_DIR)/hostap-snapshot
+HOSTAP_VERSION=0.5.8
+HOSTAP_SOURCE=hostapd-$(HOSTAP_VERSION).tar.gz
+HOSTAP_SITE=http://hostap.epitest.fi/releases
+HOSTAP_DIR=$(BUILD_DIR)/hostapd-$(HOSTAP_VERSION)
 
 $(DL_DIR)/$(HOSTAP_SOURCE):
-	$(WGET) -P $(DL_DIR) $(HOSTAP_SOURCE_URL) -O $(DL_DIR)/$(HOSTAP_SOURCE)
+	$(WGET_NOSPIDERS) -P $(DL_DIR) $(HOSTAP_SITE)/$(HOSTAP_SOURCE)
 
 hostap-source: $(DL_DIR)/$(HOSTAP_SOURCE)
 
