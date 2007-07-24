From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 24 Jul 2007 07:14:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qte
Message-ID: <20070724141436.D2321A6114@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-24 07:14:36 -0700 (Tue, 24 Jul 2007)
New Revision: 19250

Log:
Remove extra ':' from qte make

Modified:
   trunk/buildroot/package/qte/qte.mk


Changeset:
Modified: trunk/buildroot/package/qte/qte.mk
===================================================================
--- trunk/buildroot/package/qte/qte.mk	2007-07-24 14:12:38 UTC (rev 19249)
+++ trunk/buildroot/package/qte/qte.mk	2007-07-24 14:14:36 UTC (rev 19250)
@@ -236,15 +236,15 @@
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QTE_QTOPIA_DIR) install PREFIX=$(TARGET_DIR)
 
 
-qte:: $(QTE_QTE_LIB)
+qte: $(QTE_QTE_LIB)
 
 ifeq ($(strip $(BR2_PACKAGE_QTE_QTOPIA)),y)
-qte:: $(QTE_QTOPIA_IFILE)
+qte: $(QTE_QTOPIA_IFILE)
 endif
 
 # kinda no-op right now, these are built anyhow
 ifeq ($(strip $(BR2_PACKAGE_QTE_QVFB)),y)
-qte:: $(QTE_QTE_DIR)/$(QTE_UIC_BINARY) $(QTE_QTE_DIR)/$(QTE_QVFB_BINARY)
+qte: $(QTE_QTE_DIR)/$(QTE_UIC_BINARY) $(QTE_QTE_DIR)/$(QTE_QVFB_BINARY)
 endif
 
 qte-clean:
