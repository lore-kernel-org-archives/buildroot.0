From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 01:04:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: avahi dmalloc
	libdaemon mpatrol netplug
Message-ID: <20061213090459.6532948561@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 01:04:58 -0800 (Wed, 13 Dec 2006)
New Revision: 16878

Log:
- andersee, please use ZCAT / BZCAT as configured by the user.
  (see buildroot/Config.in config BR2_ZCAT and BR2_BZCAT that are available as ZCAT and BZCAT). Thanks..


Modified:
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/mpatrol/mpatrol.mk
   trunk/buildroot/package/netplug/netplug.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2006-12-13 08:55:55 UTC (rev 16877)
+++ trunk/buildroot/package/avahi/avahi.mk	2006-12-13 09:04:58 UTC (rev 16878)
@@ -14,7 +14,7 @@
 AVAHI_DIR:=$(BUILD_DIR)/avahi-$(AVAHI_VER)
 AVAHI_SITE:=http://www.avahi.org/download/
 AVAHI_SOURCE:=avahi-$(AVAHI_VER).tar.gz
-AVAHI_CAT:=zcat
+AVAHI_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(AVAHI_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AVAHI_SITE)/$(AVAHI_SOURCE)

Modified: trunk/buildroot/package/dmalloc/dmalloc.mk
===================================================================
--- trunk/buildroot/package/dmalloc/dmalloc.mk	2006-12-13 08:55:55 UTC (rev 16877)
+++ trunk/buildroot/package/dmalloc/dmalloc.mk	2006-12-13 09:04:58 UTC (rev 16878)
@@ -7,7 +7,7 @@
 DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VER).tgz
 DMALLOC_SITE:=http://dmalloc.com/releases
 DMALLOC_DIR:=$(BUILD_DIR)/dmalloc-$(DMALLOC_VER)
-DMALLOC_CAT:=zcat
+DMALLOC_CAT:=$(ZCAT)
 DMALLOC_BINARY:=dmalloc
 DMALLOC_TARGET_BINARY:=usr/bin/dmalloc
 

Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2006-12-13 08:55:55 UTC (rev 16877)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2006-12-13 09:04:58 UTC (rev 16878)
@@ -15,7 +15,7 @@
 LIBDAEMON_DIR:=$(BUILD_DIR)/libdaemon-$(LIBDAEMON_VER)
 LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
 LIBDAEMON_SOURCE:=libdaemon-$(LIBDAEMON_VER).tar.gz
-LIBDAEMON_CAT:=zcat
+LIBDAEMON_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(LIBDAEMON_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LIBDAEMON_SITE)/$(LIBDAEMON_SOURCE)

Modified: trunk/buildroot/package/mpatrol/mpatrol.mk
===================================================================
--- trunk/buildroot/package/mpatrol/mpatrol.mk	2006-12-13 08:55:55 UTC (rev 16877)
+++ trunk/buildroot/package/mpatrol/mpatrol.mk	2006-12-13 09:04:58 UTC (rev 16878)
@@ -7,7 +7,7 @@
 MPATROL_SOURCE:=mpatrol_$(MPATROL_VER).tar.gz
 MPATROL_SITE:=http://www.cbmamiga.demon.co.uk/mpatrol/files
 MPATROL_DIR:=$(BUILD_DIR)/mpatrol
-MPATROL_CAT:=zcat
+MPATROL_CAT:=$(ZCAT)
 MPATROL_BINARY:=mleak
 MPATROL_BUILD_DIR:=$(MPATROL_DIR)/build/unix
 MPATROL_TARGET_BINARY:=usr/bin/mleak

Modified: trunk/buildroot/package/netplug/netplug.mk
===================================================================
--- trunk/buildroot/package/netplug/netplug.mk	2006-12-13 08:55:55 UTC (rev 16877)
+++ trunk/buildroot/package/netplug/netplug.mk	2006-12-13 09:04:58 UTC (rev 16878)
@@ -7,7 +7,7 @@
 NETPLUG_SOURCE=netplug-$(NETPLUG_VER).tar.bz2
 NETPLUG_SITE=http://www.red-bean.com/~bos/netplug
 NETPLUG_DIR=$(BUILD_DIR)/netplug-$(NETPLUG_VER)
-NETPLUG_CAT:=bzcat
+NETPLUG_CAT:=$(BZCAT)
 NETPLUG_BINARY:=netplugd
 NETPLUG_TARGET_BINARY:=sbin/netplugd
 
