From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  4 Dec 2008 06:16:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dmraid mdadm
Message-ID: <20081204141654.8511B3C8AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-04 06:16:54 -0800 (Thu, 04 Dec 2008)
New Revision: 24263

Log:
mdadm/dmraid: bump version

Patch by: Charles Duffy <Charles_Duffy@messageone.com>

Both mdadm and dmraid packages refer to upstream versions which are no
longer available.

Modified:
   trunk/buildroot/package/dmraid/dmraid.mk
   trunk/buildroot/package/dmraid/dmraid.patch
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2008-12-04 14:02:56 UTC (rev 24262)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2008-12-04 14:16:54 UTC (rev 24263)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DMRAID_VERSION=1.0.0.rc14
+DMRAID_VERSION=1.0.0.rc15
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_DIR:=$(BUILD_DIR)/dmraid/$(DMRAID_VERSION)

Modified: trunk/buildroot/package/dmraid/dmraid.patch
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.patch	2008-12-04 14:02:56 UTC (rev 24262)
+++ trunk/buildroot/package/dmraid/dmraid.patch	2008-12-04 14:16:54 UTC (rev 24263)
@@ -1,6 +1,6 @@
---- 1.0.0.rc10/lib/device/scan.c.orig	2006-04-20 18:20:24.000000000 -0600
-+++ 1.0.0.rc10/lib/device/scan.c	2006-04-20 18:21:00.000000000 -0600
-@@ -66,7 +66,7 @@
+--- 1.0.0.rc15/lib/device/scan.c.orig	2008-06-20 09:32:05.000000000 -0500
++++ 1.0.0.rc15/lib/device/scan.c	2008-12-01 17:15:25.000000000 -0600
+@@ -69,7 +69,7 @@
  	static char *ret = NULL, *sysfs_mp;
  
  	if (!(sysfs_mp = find_sysfs_mp(lc)))
@@ -9,10 +9,10 @@
  
  	if ((ret = dbg_malloc(strlen(sysfs_mp) + strlen(path) + 1)))
  		sprintf(ret, "%s%s", sysfs_mp, path);
-@@ -308,7 +308,7 @@
+@@ -315,7 +315,7 @@
  	} else {
  		sysfs = 0;
- 		path = (char*) _PATH_DEV;
+ 		path = (char *) _PATH_DEV;
 -		log_print(lc, "carrying on with %s", path);
 +		log_notice(lc, "carrying on with %s", path);
  	}

Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2008-12-04 14:02:56 UTC (rev 24262)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2008-12-04 14:16:54 UTC (rev 24263)
@@ -3,9 +3,9 @@
 # mdadm
 #
 #############################################################
-MDADM_VERSION:=2.6.4
+MDADM_VERSION:=2.6.7.1
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
-MDADM_PATCH:=mdadm_$(MDADM_VERSION)-2.diff.gz
+MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1.diff.gz
 MDADM_CAT:=$(ZCAT)
 MDADM_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)
