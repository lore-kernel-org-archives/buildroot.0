From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:36:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20061202183655.644A0485FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:36:55 -0800 (Sat, 02 Dec 2006)
New Revision: 16762

Log:
- rm cruft via fakeroot, not afterwards where it has no effect.


Modified:
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2006-12-02 18:36:04 UTC (rev 16761)
+++ trunk/buildroot/package/at/at.mk	2006-12-02 18:36:55 UTC (rev 16762)
@@ -46,8 +46,8 @@
 	echo "$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root " \
 		"$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install" \
 		> $(STAGING_DIR)/.fakeroot.at
+	echo "rm -rf $(TARGET_DIR)/usr/man" >> $(STAGING_DIR)/.fakeroot.at
 	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/etc/init.d/S99at
-	rm -rf $(TARGET_DIR)/usr/man
 	touch -c $(TARGET_DIR)/$(AT_TARGET_BINARY)
 
 at: uclibc host-fakeroot $(TARGET_DIR)/$(AT_TARGET_BINARY)
