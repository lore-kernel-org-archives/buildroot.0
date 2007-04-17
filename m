From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 17 Apr 2007 10:02:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/setserial
Message-ID: <20070417170219.E9ECB48606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-17 10:02:15 -0700 (Tue, 17 Apr 2007)
New Revision: 18477

Log:
- bump version


Modified:
   trunk/buildroot/package/setserial/setserial.mk


Changeset:
Modified: trunk/buildroot/package/setserial/setserial.mk
===================================================================
--- trunk/buildroot/package/setserial/setserial.mk	2007-04-17 15:48:09 UTC (rev 18476)
+++ trunk/buildroot/package/setserial/setserial.mk	2007-04-17 17:02:15 UTC (rev 18477)
@@ -4,9 +4,10 @@
 #
 #############################################################
 SETSERIAL_VERSION:=2.17
-SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION).orig.tar.gz
+SETSERIAL_PATCH_VERSION:=-44
+#SETSERIAL_PATCH_FILE:=
+SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION)$(SETSERIAL_PATCH_VERSION).tar.gz
 SETSERIAL_SITE:=http://ftp.debian.org/debian/pool/main/s/setserial/
-SETSERIAL_PATCH_FILE:=setserial_$(SETSERIAL_VERSION)-43.diff.gz
 SETSERIAL_DIR:=$(BUILD_DIR)/setserial-$(SETSERIAL_VERSION)
 SETSERIAL_BINARY:=setserial
 SETSERIAL_TARGET_BINARY:=usr/bin/setserial
@@ -32,6 +33,7 @@
 		toolchain/patch-kernel.sh $(SETSERIAL_DIR) $(SETSERIAL_DIR)/debian/patches \*.patch ; \
 	fi
 endif
+	touch $(SETSERIAL_DIR)/gorhack.h
 	touch $@
 
 ifeq ($(BR2_PREFER_IMA),y)
