From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 20 Nov 2006 08:33:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openvpn
Message-ID: <20061120163305.C9DA1485A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-20 08:33:05 -0800 (Mon, 20 Nov 2006)
New Revision: 16590

Log:
- bump version.


Modified:
   trunk/buildroot/package/openvpn/openvpn.mk


Changeset:
Modified: trunk/buildroot/package/openvpn/openvpn.mk
===================================================================
--- trunk/buildroot/package/openvpn/openvpn.mk	2006-11-20 16:09:43 UTC (rev 16589)
+++ trunk/buildroot/package/openvpn/openvpn.mk	2006-11-20 16:33:05 UTC (rev 16590)
@@ -6,9 +6,10 @@
 # to enable that within busybox
 #
 #############################################################
-OPENVPN_SOURCE:=openvpn-1.5.0.tar.gz
-OPENVPN_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/openvpn/
-OPENVPN_DIR:=$(BUILD_DIR)/openvpn-1.5.0
+OPENVPN_VERSION:=2.0.9
+OPENVPN_SOURCE:=openvpn-$(OPENVPN_VERSION).tar.gz
+OPENVPN_SITE:=http://openvpn.net/release/
+OPENVPN_DIR:=$(BUILD_DIR)/openvpn-$(OPENVPN_VERSION)
 OPENVPN_CAT:=$(ZCAT)
 OPENVPN_BINARY:=openvpn
 OPENVPN_TARGET_BINARY:=usr/sbin/openvpn
@@ -50,6 +51,7 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--program-prefix="" \
+		--enable-small \
 		$(THREAD_MODEL) \
 	);
 	touch $(OPENVPN_DIR)/.configured
