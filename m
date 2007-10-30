From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 14:15:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: nfs-utils portmap
Message-ID: <20071030211546.2F1ABA6129@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 14:15:46 -0700 (Tue, 30 Oct 2007)
New Revision: 20336

Log:
Hint at 'enable RPC' requirement for nfs-utils and portmap

Modified:
   trunk/buildroot/package/nfs-utils/Config.in
   trunk/buildroot/package/portmap/Config.in


Changeset:
Modified: trunk/buildroot/package/nfs-utils/Config.in
===================================================================
--- trunk/buildroot/package/nfs-utils/Config.in	2007-10-30 20:14:12 UTC (rev 20335)
+++ trunk/buildroot/package/nfs-utils/Config.in	2007-10-30 21:15:46 UTC (rev 20336)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
+	depends on BR2_INET_RPC
 	default n
 	help
 	  The NFS Linux kernel server.
@@ -8,6 +9,9 @@
 
 	  http://sourceforge.net/projects/nfs
 
+comment "nfs-utils requires a toolchain with 'Enable RPC' selected"
+	depends on !BR2_INET_RPC
+
 menu "NFS utilities selection"
 	depends BR2_PACKAGE_NFS_UTILS
 

Modified: trunk/buildroot/package/portmap/Config.in
===================================================================
--- trunk/buildroot/package/portmap/Config.in	2007-10-30 20:14:12 UTC (rev 20335)
+++ trunk/buildroot/package/portmap/Config.in	2007-10-30 21:15:46 UTC (rev 20336)
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PORTMAP
 	bool "portmap"
 	default n
+	depends on BR2_INET_RPC
 	help
 	  The standard portmapper for RPC services.
 
 	  ftp://ftp.porcupine.org/pub/security/index.html
+
+comment "portmap requires a toolchain with 'Enable RPC' selected"
+	depends on !BR2_INET_RPC
