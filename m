From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 22:31:26 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
Message-ID: <20090111223126.C8A1A76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 22:31:25 +0000 (Sun, 11 Jan 2009)
New Revision: 24776

Log:
revert patch to allow downloading sudo from an EXISTING location

Modified:
   trunk/buildroot/package/sudo/sudo.mk


Changeset:
Modified: trunk/buildroot/package/sudo/sudo.mk
===================================================================
--- trunk/buildroot/package/sudo/sudo.mk	2009-01-11 22:11:29 UTC (rev 24775)
+++ trunk/buildroot/package/sudo/sudo.mk	2009-01-11 22:31:25 UTC (rev 24776)
@@ -5,13 +5,14 @@
 #############################################################
 
 SUDO_VERSION:=1.6.8p12
-SUDO_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sudo
+SUDO_SITE:=$(BR2_ATMEL_MIRROR)
 
 #SUDO_VERSION:=1.7.0
 #SUDO_SITE:=http://www.courtesan.com/sudo/dist
 # 1.7.0 Needs update Cross-Compiler patches
 
-SUDO_SOURCE:=sudo_$(SUDO_VERSION).orig.tar.gz
+
+SUDO_SOURCE:=sudo-$(SUDO_VERSION).tar.gz
 SUDO_DIR:=$(BUILD_DIR)/sudo-$(SUDO_VERSION)
 SUDO_UNZIP:=$(ZCAT)
 
