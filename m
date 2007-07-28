From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 16:02:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: berkeleydb bzip2
	dialog ipsec-tools lsof etc...
Message-ID: <20070728230227.BE21CA461B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 16:02:26 -0700 (Sat, 28 Jul 2007)
New Revision: 19309

Log:
Replace space by tabs

Modified:
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/bzip2/bzip2.mk
   trunk/buildroot/package/dialog/Config.in
   trunk/buildroot/package/ipsec-tools/Config.in
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/lsof/Config.in
   trunk/buildroot/package/openntpd/Config.in
   trunk/buildroot/package/procps/procps.mk
   trunk/buildroot/package/qte/Config.in
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/raidtools/raidtools.mk
   trunk/buildroot/package/setserial/Config.in
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/udev/Config.in
   trunk/buildroot/package/usbmount/usbmount.mk
   trunk/buildroot/package/vsftpd/Config.in


Changeset:
Modified: trunk/buildroot/package/berkeleydb/berkeleydb.mk
===================================================================
--- trunk/buildroot/package/berkeleydb/berkeleydb.mk	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/berkeleydb/berkeleydb.mk	2007-07-28 23:02:26 UTC (rev 19309)
@@ -47,7 +47,7 @@
 		--disable-tcl \
 		--disable-compat185 \
 		--with-pic \
-                $(DISABLE_LARGEFILE) \
+	        $(DISABLE_LARGEFILE) \
 	);
 	$(SED) 's/\.lo/.o/g' $(DB_DIR)/build_unix/Makefile
 	touch $(DB_DIR)/.configured

Modified: trunk/buildroot/package/bzip2/bzip2.mk
===================================================================
--- trunk/buildroot/package/bzip2/bzip2.mk	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/bzip2/bzip2.mk	2007-07-28 23:02:26 UTC (rev 19309)
@@ -20,7 +20,7 @@
 	$(BZIP2_CAT) $(DL_DIR)/$(BZIP2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(BZIP2_DIR)/Makefile
 	$(SED) "s,ln -s (lib.*),ln -snf \$$1 ; ln -snf libbz2.so.$(BZIP2_VERSION) \
-            libbz2.so,g" $(BZIP2_DIR)/Makefile-libbz2_so
+	    libbz2.so,g" $(BZIP2_DIR)/Makefile-libbz2_so
 ifneq ($(BR2_LARGEFILE),y)
 	$(SED) "s,^BIGFILES,#BIGFILES,g" $(BZIP2_DIR)/Makefile
 	$(SED) "s,^BIGFILES,#BIGFILES,g" $(BZIP2_DIR)/Makefile-libbz2_so

Modified: trunk/buildroot/package/dialog/Config.in
===================================================================
--- trunk/buildroot/package/dialog/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/dialog/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -3,9 +3,9 @@
     default n
     select BR2_PACKAGE_NCURSES
     help
-        dialog - display dialog boxes from shell scripts
+	dialog - display dialog boxes from shell scripts
 
-        This application provides a method of displaying several different
+	This application provides a method of displaying several different
 	types of dialog boxes from shell scripts.  This allows a developer
 	of a script to interact with the user in a much friendlier manner.
 

Modified: trunk/buildroot/package/ipsec-tools/Config.in
===================================================================
--- trunk/buildroot/package/ipsec-tools/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/ipsec-tools/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	default n
-        select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
 	help
 	  This package is required to support IPSec for Linux 2.6+
@@ -12,7 +12,7 @@
 	bool "Enable racoonctl(8)."
 	help
 		Lets racoon to listen to racoon admin port, which is to
-                be contacted by racoonctl(8).
+	        be contacted by racoonctl(8).
 
 config BR2_PACKAGE_IPSEC_TOOLS_NATT
 	default n
@@ -34,8 +34,8 @@
 	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable IKE fragmentation."
 	help
-                Enable IKE fragmentation, which is a workaround for
-                broken routers that drop fragmented packets
+	        Enable IKE fragmentation, which is a workaround for
+	        broken routers that drop fragmented packets
 
 config BR2_PACKAGE_IPSEC_TOOLS_STATS
 	default y

Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-07-28 23:02:26 UTC (rev 19309)
@@ -107,7 +107,7 @@
   $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOONCTL) 
 	$(MAKE) -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) install
 	$(STRIP) --strip-unneeded --remove-section=.comment \
-          --remove-section=.note \
+	  --remove-section=.note \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_SETKEY) \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON) \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)

Modified: trunk/buildroot/package/lsof/Config.in
===================================================================
--- trunk/buildroot/package/lsof/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/lsof/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -2,8 +2,8 @@
 	bool "lsof"
 	default n
 	help
-          lsof (LiSt Open Files)
-          The lsof tool lists information about files opened by 
-          processes.
+	  lsof (LiSt Open Files)
+	  The lsof tool lists information about files opened by 
+	  processes.
 
 	  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/

Modified: trunk/buildroot/package/openntpd/Config.in
===================================================================
--- trunk/buildroot/package/openntpd/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/openntpd/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENNTPD
-        bool "OpenNTPD"
-        default n
-        help
+	bool "OpenNTPD"
+	default n
+	help
 	     OpenNTPD is an easy to use implementation of the Network Time
 	     Protocol. It provides the ability to sync the local clock
 	     to remote NTP servers and can act as NTP server itself,

Modified: trunk/buildroot/package/procps/procps.mk
===================================================================
--- trunk/buildroot/package/procps/procps.mk	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/procps/procps.mk	2007-07-28 23:02:26 UTC (rev 19309)
@@ -33,9 +33,9 @@
 
 procps-clean:
 	for bin in uptime tload free w \
-	           top vmstat watch skill \
-	           snice kill sysctl pmap \
-	           pgrep pkill slabtop ; do \
+		   top vmstat watch skill \
+		   snice kill sysctl pmap \
+		   pgrep pkill slabtop ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$${bin} ; \
 	done
 	rm -f $(TARGET_DIR)/lib/libproc*

Modified: trunk/buildroot/package/qte/Config.in
===================================================================
--- trunk/buildroot/package/qte/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/qte/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -14,44 +14,44 @@
 
 
 config BR2_PACKAGE_QTE_COMMERCIAL_USERNAME
-        string "Qt/E Commercial License Username"
-        default ""
+	string "Qt/E Commercial License Username"
+	default ""
 	depends BR2_PACKAGE_QTE
-        help
-            Commercial users can download their source directly by providing a username.  I do not mean this to be a political or economic statement, just a convenience function
+	help
+	    Commercial users can download their source directly by providing a username.  I do not mean this to be a political or economic statement, just a convenience function
 
 
 config BR2_PACKAGE_QTE_COMMERCIAL_PASSWORD
-        string "Qt/E Commercial License Password"
-        default ""
+	string "Qt/E Commercial License Password"
+	default ""
 	depends BR2_PACKAGE_QTE
-        help
-            Commercial users can download their source directly by providing a password.  I do not mean this to be a political or economic statement, just a convenience function
+	help
+	    Commercial users can download their source directly by providing a password.  I do not mean this to be a political or economic statement, just a convenience function
 
 
 choice
-        prompt "Qt/E Version"
-        default BR2_QTE_VERSION_2_3_11
+	prompt "Qt/E Version"
+	default BR2_QTE_VERSION_2_3_11
 	depends BR2_PACKAGE_QTE
-        help
-          Select the version of Qt/E you wish to use.
+	help
+	  Select the version of Qt/E you wish to use.
 
-        config BR2_QTE_VERSION_2_3_8
-                bool "Qt/E 2.3.8"
+	config BR2_QTE_VERSION_2_3_8
+	        bool "Qt/E 2.3.8"
 
-        config BR2_QTE_VERSION_2_3_9
-                bool "Qt/E 2.3.9"
+	config BR2_QTE_VERSION_2_3_9
+	        bool "Qt/E 2.3.9"
 
-        config BR2_QTE_VERSION_2_3_10
-                bool "Qt/E 2.3.10"
+	config BR2_QTE_VERSION_2_3_10
+	        bool "Qt/E 2.3.10"
 
-        config BR2_QTE_VERSION_2_3_11
-                bool "Qt/E 2.3.11"
+	config BR2_QTE_VERSION_2_3_11
+	        bool "Qt/E 2.3.11"
 
 endchoice
 
 config BR2_QTE_VERSION
-        string
+	string
 	default "2.3.8"		if BR2_QTE_VERSION_2_3_8
 	default "2.3.9"		if BR2_QTE_VERSION_2_3_9
 	default "2.3.10"		if BR2_QTE_VERSION_2_3_10
@@ -68,22 +68,22 @@
 	  http://trolltech.com/
 
 choice
-        prompt "QVfb Version"
-        default BR2_QTE_QVFB_VERSION_2_3_2
+	prompt "QVfb Version"
+	default BR2_QTE_QVFB_VERSION_2_3_2
 	depends BR2_PACKAGE_QTE_QVFB
-        help
-          Select the version of QVfb you wish to use.
+	help
+	  Select the version of QVfb you wish to use.
 
-        config BR2_QTE_QVFB_VERSION_2_3_2
-                bool "QVfb 2.3.2"
+	config BR2_QTE_QVFB_VERSION_2_3_2
+	        bool "QVfb 2.3.2"
 
-        config BR2_QTE_QVFB_VERSION_2_3_9
-                bool "QVfb 2.3.9"
+	config BR2_QTE_QVFB_VERSION_2_3_9
+	        bool "QVfb 2.3.9"
 
 endchoice
 
 config BR2_QTE_QVFB_VERSION
-        string
+	string
 	default "2.3.2"		if BR2_QTE_QVFB_VERSION_2_3_2
 	default "2.3.9"		if BR2_QTE_QVFB_VERSION_2_3_9
 
@@ -99,22 +99,22 @@
 	  http://trolltech.com/
 
 choice
-        prompt "QT/E v3 Version"
-        default BR2_QTE_QT3_VERSION_3_3_4
+	prompt "QT/E v3 Version"
+	default BR2_QTE_QT3_VERSION_3_3_4
 	depends BR2_PACKAGE_QTE_QT3
-        help
-          Select the version of QVfb you wish to use.
+	help
+	  Select the version of QVfb you wish to use.
 
-        config BR2_QTE_QT3_VERSION_3_3_4
-                bool "Qt/E 3.3.4"
+	config BR2_QTE_QT3_VERSION_3_3_4
+	        bool "Qt/E 3.3.4"
 
-        config BR2_QTE_QT3_VERSION_3_3_3
-                bool "Qt/E 3.3.3"
+	config BR2_QTE_QT3_VERSION_3_3_3
+	        bool "Qt/E 3.3.3"
 
 endchoice
 
 config BR2_QTE_QT3_VERSION
-        string
+	string
 	default "3.3.4"		if BR2_QTE_QT3_VERSION_3_3_4
 	default "3.3.3"		if BR2_QTE_QT3_VERSION_3_3_3
 
@@ -129,27 +129,27 @@
 	  http://trolltech.com/
 
 choice
-        prompt "Qtopia Version"
-        default BR2_QTE_QTOPIA_VERSION_2_1_2
+	prompt "Qtopia Version"
+	default BR2_QTE_QTOPIA_VERSION_2_1_2
 	depends BR2_PACKAGE_QTE_QTOPIA
-        help
-          Select the version of Qtopia you wish to use.
+	help
+	  Select the version of Qtopia you wish to use.
 
-        config BR2_QTE_QTOPIA_VERSION_2_1_1
-                bool "Qtopia 2.1.1"
+	config BR2_QTE_QTOPIA_VERSION_2_1_1
+	        bool "Qtopia 2.1.1"
 
-        config BR2_QTE_QTOPIA_VERSION_2_1_2
-                bool "Qtopia 2.1.2"
+	config BR2_QTE_QTOPIA_VERSION_2_1_2
+	        bool "Qtopia 2.1.2"
 
 endchoice
 
 config BR2_QTE_QTOPIA_VERSION
-        string
+	string
 	default "2.1.1"		if BR2_QTE_QTOPIA_VERSION_2_1_1
 	default "2.1.2"		if BR2_QTE_QTOPIA_VERSION_2_1_2
 
 config BR2_QTE_TMAKE_VERSION
-        string
+	string
 	default "1.13"
 	depends BR2_PACKAGE_QTE
 
@@ -158,11 +158,11 @@
 #   awk '{BR="BR2_QTE_CROSS_"toupper($1); gsub("-","_",BR); gsub("+","P",BR); printf"\tconfig %s\n\t\tbool \"%s\"\n\n",BR,$1}'
 
 choice
-        prompt "Qt/E Cross-Compiler Target Platform"
-        default BR2_QTE_CROSS_LINUX_ARM_GPP
+	prompt "Qt/E Cross-Compiler Target Platform"
+	default BR2_QTE_CROSS_LINUX_ARM_GPP
 	depends BR2_PACKAGE_QTE
-        help
-          Select the Qt cross-platform string for your build
+	help
+	  Select the Qt cross-platform string for your build
 
 	config BR2_QTE_CROSS_CYGWIN_ARM_GPP
 		# qtopia-phone does not have this platform in qtopia-phone-2.1.1/src/libraries/qtopia/custom-cygwin-arm-g++.{cpp,h}
@@ -240,7 +240,7 @@
 endchoice
 
 config BR2_QTE_CROSS_PLATFORM
-        string
+	string
 # generated from:
 # ls ~/src/buildroot/build_arm/qt-2.3.10/configs/*-static|cut -c56-|sed -e 's/-static//g'|\
 #   awk '{BR="BR2_QTE_CROSS_"toupper($1); gsub("-","_",BR); gsub("+","P",BR); printf"\tdefault \"%s\"\tif %s\n",$1,BR}'

Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/qtopia4/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -11,10 +11,10 @@
 	  http://www.trolltech.com/
 
 config BR2_PACKAGE_QTOPIA4_DEBUG
-        bool "Compile with debug support"
-        default y
+	bool "Compile with debug support"
+	default y
 	depends BR2_PACKAGE_QTOPIA4
-        help
+	help
 
 choice
 	prompt "Qtopia 4 Core license type"
@@ -45,37 +45,37 @@
 
 
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME
-        string "Qtopia Core 4 Commercial License Username"
-        default ""
+	string "Qtopia Core 4 Commercial License Username"
+	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
-        help
-            Commercial users can download their source directly by providing a username.
+	help
+	    Commercial users can download their source directly by providing a username.
 
 
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
-        string "Qtopia Core 4 Commercial License Password"
-        default ""
+	string "Qtopia Core 4 Commercial License Password"
+	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
-        help
-            Commercial users can download their source directly by providing a password.
+	help
+	    Commercial users can download their source directly by providing a password.
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
-        bool "Compatibility with Qt3"
-        default y
+	bool "Compatibility with Qt3"
+	default y
 	depends BR2_PACKAGE_QTOPIA4
-        help
+	help
 	    Turns on support for older Qt3.
 
 config BR2_PACKAGE_QTOPIA4_DEPTHS
-        string "color depths to support"
-        default "-depths 8"
+	string "color depths to support"
+	default "-depths 8"
 	depends BR2_PACKAGE_QTOPIA4
-        help
+	help
 	    Which color depths to support for the library. Default is "-depths
 	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
 
 config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
-        string "The embedded platform we are making Qtopia4 for"
+	string "The embedded platform we are making Qtopia4 for"
 	default "arm"	if BR2_arm
 	default "arm"	if BR2_armeb
 	default "x86"	if BR2_i386
@@ -92,5 +92,5 @@
 	default "generic"	if BR2_sh64
 	default "generic"	if BR2_sparc
 	depends BR2_PACKAGE_QTOPIA4
-        help
+	help
 	    The platform.

Modified: trunk/buildroot/package/raidtools/raidtools.mk
===================================================================
--- trunk/buildroot/package/raidtools/raidtools.mk	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/raidtools/raidtools.mk	2007-07-28 23:02:26 UTC (rev 19309)
@@ -24,28 +24,28 @@
 	(cd $(RAIDTOOLS2_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-                ./configure \
-                --target=$(GNU_TARGET_NAME) \
-                --host=$(GNU_TARGET_NAME) \
-                --build=$(GNU_HOST_NAME) \
-                --prefix=/usr \
-                --exec-prefix=/usr \
-                --bindir=/usr/bin \
-                --sbindir=/usr/sbin \
+	        ./configure \
+	        --target=$(GNU_TARGET_NAME) \
+	        --host=$(GNU_TARGET_NAME) \
+	        --build=$(GNU_HOST_NAME) \
+	        --prefix=/usr \
+	        --exec-prefix=/usr \
+	        --bindir=/usr/bin \
+	        --sbindir=/usr/sbin \
 		--libdir=/lib \
-                --libexecdir=/usr/lib \
-                --sysconfdir=/etc \
-                --datadir=/usr/share/misc \
-                --localstatedir=/var \
-                --mandir=/usr/man \
-                --infodir=/usr/info \
+	        --libexecdir=/usr/lib \
+	        --sysconfdir=/etc \
+	        --datadir=/usr/share/misc \
+	        --localstatedir=/var \
+	        --mandir=/usr/man \
+	        --infodir=/usr/info \
 		$(DISABLE_NLS) \
-                --enable-fsect-man5 \
-        );
+	        --enable-fsect-man5 \
+	);
 	touch $(RAIDTOOLS2_DIR)/.configured
 
 $(RAIDTOOLS2_DIR)/$(RAIDTOOLS2_BINARY): $(RAIDTOOLS2_DIR)/.configured
-        $(MAKE) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR)
+	$(MAKE) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR)
 
 $(TARGET_DIR)/$(RAIDTOOLS2_TARGET_BINARY): $(RAIDTOOLS2_DIR)/$(RAIDTOOLS2_BINARY)
 	$(MAKE) ROOTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR) install

Modified: trunk/buildroot/package/setserial/Config.in
===================================================================
--- trunk/buildroot/package/setserial/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/setserial/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_SETSERIAL
-        bool "setserial"
-        default n
-        help
-             Setserial : configuration of serial ports
+	bool "setserial"
+	default n
+	help
+	     Setserial : configuration of serial ports

Modified: trunk/buildroot/package/socat/socat.mk
===================================================================
--- trunk/buildroot/package/socat/socat.mk	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/socat/socat.mk	2007-07-28 23:02:26 UTC (rev 19309)
@@ -49,7 +49,7 @@
 		$(DISABLE_NLS); \
 	$(SED) 's/#define HAVE_TERMIOS_ISPEED 1/#undef HAVE_TERMIOS_ISPEED/g' config.h; \
 	);
-        
+	
 $(SOCAT_WORKDIR)/socat:	$(SOCAT_WORKDIR)/Makefile
 	rm -f $@
 	$(MAKE) -C $(SOCAT_WORKDIR)

Modified: trunk/buildroot/package/udev/Config.in
===================================================================
--- trunk/buildroot/package/udev/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/udev/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -7,28 +7,28 @@
 	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 
 config BR2_PACKAGE_UDEV_UTILS
-        bool "udev-utils"
-        default n
-        depends on BR2_PACKAGE_UDEV
-        help
-          Adds the udevmonitor, udevinfo, and udevtest binaries
+	bool "udev-utils"
+	default n
+	depends on BR2_PACKAGE_UDEV
+	help
+	  Adds the udevmonitor, udevinfo, and udevtest binaries
 	  to your filesystem.
 
 menu "Extra udev tools"
-        depends BR2_PACKAGE_UDEV
+	depends BR2_PACKAGE_UDEV
 
 config BR2_PACKAGE_UDEV_VOLUME_ID
-        bool "udev-libvolume_id"
-        default n
-        depends on BR2_PACKAGE_UDEV
-        help
-          Build and install volume identification library.
+	bool "udev-libvolume_id"
+	default n
+	depends on BR2_PACKAGE_UDEV
+	help
+	  Build and install volume identification library.
 
 config BR2_PACKAGE_UDEV_SCSI_ID
-        bool "udev-scsi_id"
-        default n
-        depends on BR2_PACKAGE_UDEV
-        help
-          Build and install SCSI disk identification library.
+	bool "udev-scsi_id"
+	default n
+	depends on BR2_PACKAGE_UDEV
+	help
+	  Build and install SCSI disk identification library.
 
 endmenu

Modified: trunk/buildroot/package/usbmount/usbmount.mk
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.mk	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/usbmount/usbmount.mk	2007-07-28 23:02:26 UTC (rev 19309)
@@ -24,8 +24,8 @@
 $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked
 	$(INSTALL) -m 0755 -D $(USBMOUNT_DIR)/usbmount $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)
 	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ] ; then \
-                $(INSTALL) -m 0644 -D $(USBMOUNT_DIR)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
-        fi;
+	        $(INSTALL) -m 0644 -D $(USBMOUNT_DIR)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
+	fi;
 	touch -c $@
 
 usbmount: uclibc $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY)

Modified: trunk/buildroot/package/vsftpd/Config.in
===================================================================
--- trunk/buildroot/package/vsftpd/Config.in	2007-07-28 21:51:58 UTC (rev 19308)
+++ trunk/buildroot/package/vsftpd/Config.in	2007-07-28 23:02:26 UTC (rev 19309)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_VSFTPD
-        bool "vsftpd"
-        default n
-        help
+	bool "vsftpd"
+	default n
+	help
 	  vsftpd is an ftp daemon written with security in mind.
-          http://vsftpd.beasts.org/
+	  http://vsftpd.beasts.org/
 
