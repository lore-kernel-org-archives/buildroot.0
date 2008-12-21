From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 21 Dec 2008 15:34:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/setserial
Message-ID: <20081221153439.09713768CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-21 15:34:38 +0000 (Sun, 21 Dec 2008)
New Revision: 24479

Log:
Bump version of setserial

Modified:
   trunk/buildroot/package/setserial/setserial.mk


Changeset:
Modified: trunk/buildroot/package/setserial/setserial.mk
===================================================================
--- trunk/buildroot/package/setserial/setserial.mk	2008-12-21 14:50:55 UTC (rev 24478)
+++ trunk/buildroot/package/setserial/setserial.mk	2008-12-21 15:34:38 UTC (rev 24479)
@@ -4,8 +4,8 @@
 #
 #############################################################
 SETSERIAL_VERSION:=2.17
-SETSERIAL_PATCH_VERSION:=-44
-#SETSERIAL_PATCH_FILE:=
+SETSERIAL_PATCH_VERSION:=.orig
+SETSERIAL_PATCH_FILE:=setserial_2.17-45.diff.gz
 SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION)$(SETSERIAL_PATCH_VERSION).tar.gz
 SETSERIAL_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
 SETSERIAL_DIR:=$(BUILD_DIR)/setserial-$(SETSERIAL_VERSION)
@@ -65,6 +65,8 @@
 
 setserial-source: $(DL_DIR)/$(SETSERIAL_SOURCE) $(SETSERIAL_PATCH)
 
+setserial-unpacked: $(SETSERIAL_DIR)/.unpacked
+
 setserial-clean:
 	rm -f $(TARGET_DIR)/$(SETSERIAL_TARGET_BINARY)
 	-$(MAKE) -C $(SETSERIAL_DIR) clean
