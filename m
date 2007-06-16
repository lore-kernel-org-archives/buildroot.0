From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 16 Jun 2007 10:54:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: nfs-utils portmap
	proftpd samba tftpd ud etc...
Message-ID: <20070616175439.EA612485C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-06-16 10:54:38 -0700 (Sat, 16 Jun 2007)
New Revision: 18832

Log:
Fix install of scripts.


Modified:
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/portmap/portmap.mk
   trunk/buildroot/package/proftpd/proftpd.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/udev/udev.mk


Changeset:
Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-06-16 14:16:30 UTC (rev 18831)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-06-16 17:54:38 UTC (rev 18832)
@@ -64,7 +64,7 @@
 	echo "$(MAKE) prefix=$(TARGET_DIR)/usr statedir=$(TARGET_DIR)/var/lib/nfs CC=$(TARGET_CC) -C $(NFS_UTILS_DIR) install" > $@
 	echo "rm -f $(TARGET_DIR)/usr/bin/event_rpcgen.py $(TARGET_DIR)/usr/sbin/nhfs* $(TARGET_DIR)/usr/sbin/nfsstat $(TARGET_DIR)/usr/sbin/showmount" >> $@
 	echo "rm -rf $(TARGET_DIR)/usr/share/man" >> $@
-	echo "$(INSTALL) -m 0755 -D package/nfs-utils/S60nfs $(TARGET_DIR)/etc/init.d" >> $@
+	echo "$(INSTALL) -m 0755 package/nfs-utils/S60nfs $(TARGET_DIR)/etc/init.d" >> $@
 	echo -n "for file in $(NFS_UTILS_TARGETS_) ; do rm -f $(TARGET_DIR)/" >> $@
 	echo -n "\$$" >> $@
 	echo "file; done" >> $@

Modified: trunk/buildroot/package/portmap/portmap.mk
===================================================================
--- trunk/buildroot/package/portmap/portmap.mk	2007-06-16 14:16:30 UTC (rev 18831)
+++ trunk/buildroot/package/portmap/portmap.mk	2007-06-16 17:54:38 UTC (rev 18832)
@@ -26,7 +26,7 @@
 
 $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY): $(PORTMAP_DIR)/$(PORTMAP_BINARY)
 	$(INSTALL) -D $(PORTMAP_DIR)/$(PORTMAP_BINARY) $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
-	$(INSTALL) -m 0755 -D package/portmap/S13portmap $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d
 
 portmap: uclibc $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
 

Modified: trunk/buildroot/package/proftpd/proftpd.mk
===================================================================
--- trunk/buildroot/package/proftpd/proftpd.mk	2007-06-16 14:16:30 UTC (rev 18831)
+++ trunk/buildroot/package/proftpd/proftpd.mk	2007-06-16 17:54:38 UTC (rev 18832)
@@ -56,7 +56,7 @@
 	@if [ ! -f $(TARGET_DIR)/etc/proftpd.conf ] ; then \
 		$(INSTALL) -m 0644 -D $(PROFTPD_DIR)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
 	fi;
-	$(INSTALL) -m 0755 -D package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
 
 proftpd: uclibc $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
 

Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-06-16 14:16:30 UTC (rev 18831)
+++ trunk/buildroot/package/samba/samba.mk	2007-06-16 17:54:38 UTC (rev 18832)
@@ -92,7 +92,7 @@
 	for file in $(SAMBA_TARGETS_) ; do \
 		rm -f $(TARGET_DIR)/$$file; \
 	done
-	$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/samba/S91smb $(TARGET_DIR)/etc/init.d
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ] ; then \
 		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
 	fi;

Modified: trunk/buildroot/package/tftpd/tftpd.mk
===================================================================
--- trunk/buildroot/package/tftpd/tftpd.mk	2007-06-16 14:16:30 UTC (rev 18831)
+++ trunk/buildroot/package/tftpd/tftpd.mk	2007-06-16 17:54:38 UTC (rev 18832)
@@ -59,7 +59,7 @@
 	    rm -f $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); \
 	    cp -a $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); fi ;
 	@if [ ! -f $(TARGET_DIR)/etc/init.d/S80tftpd-hpa ] ; then \
-		$(INSTALL) -m 0755 -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d \
+		$(INSTALL) -m 0755 package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d; \
 	fi;
 
 tftpd: uclibc $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY)

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-06-16 14:16:30 UTC (rev 18831)
+++ trunk/buildroot/package/udev/udev.mk	2007-06-16 17:54:38 UTC (rev 18832)
@@ -45,7 +45,7 @@
 		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
-	$(INSTALL) -m 0755 -D package/udev/S10udev $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
 	rm -rf $(TARGET_DIR)/usr/share/man
 ifneq ($(strip $(BR2_PACKAGE_UDEV_UTILS)),y)
 	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor
