From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 22:39:13 +0200 (CEST)
Subject: [Buildroot] package/hostap
Message-ID: <0707082225480.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Won't do too much good, as:

* the hostap driver is part of the kernel nowadays
* the tarball has changed directory structure

but this will at least get the download right :)

===================================================================
--- package/hostap/hostap.mk	(revision 19046)
+++ package/hostap/hostap.mk	(working copy)
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


-- 
Cristian
