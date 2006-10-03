From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  3 Oct 2006 06:42:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
Message-ID: <20061003134243.2B50048593@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-03 06:42:42 -0700 (Tue, 03 Oct 2006)
New Revision: 16296

Log:
- late binding isn't a good idea there, i did end up with an empty SOURCE.


Modified:
   trunk/buildroot/package/sudo/sudo.mk


Changeset:
Modified: trunk/buildroot/package/sudo/sudo.mk
===================================================================
--- trunk/buildroot/package/sudo/sudo.mk	2006-10-03 10:47:35 UTC (rev 16295)
+++ trunk/buildroot/package/sudo/sudo.mk	2006-10-03 13:42:42 UTC (rev 16296)
@@ -5,10 +5,10 @@
 #############################################################
 
 SUDO_VER:=1.6.8p9
+SUDO_SOURCE:=sudo-$(SUDO_VER).tar.gz
+SUDO_SITE:=http://www.courtesan.com/sudo/dist
 SUDO_DIR:=$(BUILD_DIR)/sudo-$(SUDO_VER)
-SUDO_SOURCE:=sudo-$(SUDO_VER).tar.gz
-SUDO_SITE=http://www.courtesan.com/sudo/dist
-SUDO_UNZIP=$(ZCAT)
+SUDO_UNZIP:=$(ZCAT)
 
 $(DL_DIR)/$(SUDO_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(SUDO_SITE)/$(SUDO_SOURCE)
