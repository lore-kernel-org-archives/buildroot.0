From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 07:15:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
Message-ID: <20061215151536.B77044858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 07:15:35 -0800 (Fri, 15 Dec 2006)
New Revision: 16947

Log:
- sudo depends on host-fakeroot


Modified:
   trunk/buildroot/package/sudo/sudo.mk


Changeset:
Modified: trunk/buildroot/package/sudo/sudo.mk
===================================================================
--- trunk/buildroot/package/sudo/sudo.mk	2006-12-15 14:40:55 UTC (rev 16946)
+++ trunk/buildroot/package/sudo/sudo.mk	2006-12-15 15:15:35 UTC (rev 16947)
@@ -17,7 +17,6 @@
 
 $(SUDO_DIR)/.unpacked: $(DL_DIR)/$(SUDO_SOURCE)
 	$(SUDO_UNZIP) $(DL_DIR)/$(SUDO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	# Allow sudo patches.
 	toolchain/patch-kernel.sh $(SUDO_DIR) package/sudo sudo\*.patch
 	touch $(SUDO_DIR)/.unpacked
 
@@ -60,7 +59,7 @@
 		> $(STAGING_DIR)/.fakeroot.sudo
 	touch -c $(TARGET_DIR)/usr/bin/sudo
 
-sudo: uclibc $(TARGET_DIR)/usr/bin/sudo
+sudo: uclibc host-fakeroot $(TARGET_DIR)/usr/bin/sudo
 
 sudo-clean:
 	rm -f $(TARGET_DIR)/usr/bin/sudo
