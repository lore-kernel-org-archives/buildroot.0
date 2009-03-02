From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 08:33:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microcom
Message-ID: <20090302083356.877477656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 08:33:55 +0000 (Mon, 02 Mar 2009)
New Revision: 25477

Log:
microcom: upstream missing, mark as deprecated

People should use the busybox version these days anyway.

Modified:
   trunk/buildroot/package/microcom/Config.in
   trunk/buildroot/package/microcom/microcom.mk


Changeset:
Modified: trunk/buildroot/package/microcom/Config.in
===================================================================
--- trunk/buildroot/package/microcom/Config.in	2009-03-02 07:59:37 UTC (rev 25476)
+++ trunk/buildroot/package/microcom/Config.in	2009-03-02 08:33:55 UTC (rev 25477)
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_MICROCOM
+	depends on BR2_DEPRECATED
 	bool "microcom"
 	help
 	  A minicom-like serial terminal emulator with scripting support.

Modified: trunk/buildroot/package/microcom/microcom.mk
===================================================================
--- trunk/buildroot/package/microcom/microcom.mk	2009-03-02 07:59:37 UTC (rev 25476)
+++ trunk/buildroot/package/microcom/microcom.mk	2009-03-02 08:33:55 UTC (rev 25477)
@@ -26,7 +26,7 @@
 # TARGETS
 # http://microcom.port5.com/m102.tar.gz
 MICROCOM_VERSION:=1.02
-MICROCOM_SITE:=http://buildroot.uclibc.org/downloads/buildroot-sources/
+MICROCOM_SITE:=http://buildroot.net/downloads/sources/
 MICROCOM_SOURCE:=m102.tar.gz
 MICROCOM_DIR:=$(BUILD_DIR)/microcom-$(MICROCOM_VERSION)
 
