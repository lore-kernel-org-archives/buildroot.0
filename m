From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  8 Jul 2007 21:59:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hostap
Message-ID: <20070709045947.D862330066@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-08 21:59:45 -0700 (Sun, 08 Jul 2007)
New Revision: 19051

Log:
WGET_NOSPIDERS is not defined, use WGET for now

Modified:
   trunk/buildroot/package/hostap/hostap.mk


Changeset:
Modified: trunk/buildroot/package/hostap/hostap.mk
===================================================================
--- trunk/buildroot/package/hostap/hostap.mk	2007-07-09 04:40:53 UTC (rev 19050)
+++ trunk/buildroot/package/hostap/hostap.mk	2007-07-09 04:59:45 UTC (rev 19051)
@@ -9,7 +9,7 @@
 HOSTAP_DIR=$(BUILD_DIR)/hostapd-$(HOSTAP_VERSION)
 
 $(DL_DIR)/$(HOSTAP_SOURCE):
-	$(WGET_NOSPIDERS) -P $(DL_DIR) $(HOSTAP_SITE)/$(HOSTAP_SOURCE)
+	$(WGET) -P $(DL_DIR) $(HOSTAP_SITE)/$(HOSTAP_SOURCE)
 
 hostap-source: $(DL_DIR)/$(HOSTAP_SOURCE)
 
