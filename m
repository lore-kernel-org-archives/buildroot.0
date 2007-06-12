From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 12 Jun 2007 08:30:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cramfs squashfs
Message-ID: <20070612153032.9A1C848015@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-06-12 08:30:32 -0700 (Tue, 12 Jun 2007)
New Revision: 18803

Log:
Use BR2_ENDIAN for big/little endianness detection

Modified:
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk


Changeset:
Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-06-12 15:19:27 UTC (rev 18802)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-06-12 15:30:32 UTC (rev 18803)
@@ -39,25 +39,11 @@
 # Build the cramfs root filesystem image
 #
 #############################################################
-CRAMFS_ENDIANNESS=-l
-ifeq ($(strip $(BR2_armeb)),y)
+ifeq ($(BR2_ENDIAN),"BIG")
 CRAMFS_ENDIANNESS=-b
+else
+CRAMFS_ENDIANNESS=-l
 endif
-ifeq ($(strip $(BR2_mips)),y)
-CRAMFS_ENDIANNESS=-b
-endif
-ifeq ($(strip $(BR2_powerpc)),y)
-CRAMFS_ENDIANNESS=-b
-endif
-ifeq ($(strip $(BR2_sh3eb)),y)
-CRAMFS_ENDIANNESS=-b
-endif
-ifeq ($(strip $(BR2_sh4eb)),y)
-CRAMFS_ENDIANNESS=-b
-endif
-ifeq ($(strip $(BR2_sparc)),y)
-CRAMFS_ENDIANNESS=-b
-endif
 
 CRAMFS_TARGET=$(IMAGE).cramfs
 

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-06-12 15:19:27 UTC (rev 18802)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-06-12 15:30:32 UTC (rev 18803)
@@ -35,25 +35,11 @@
 # Build the squashfs root filesystem image
 #
 #############################################################
-SQUASHFS_ENDIANNESS=-le
-ifeq ($(strip $(BR2_armeb)),y)
+ifeq ($(BR2_ENDIAN),"BIG")
 SQUASHFS_ENDIANNESS=-be
+else
+SQUASHFS_ENDIANNESS=-le
 endif
-ifeq ($(strip $(BR2_mips)),y)
-SQUASHFS_ENDIANNESS=-be
-endif
-ifeq ($(strip $(BR2_powerpc)),y)
-SQUASHFS_ENDIANNESS=-be
-endif
-ifeq ($(strip $(BR2_sh3eb)),y)
-SQUASHFS_ENDIANNESS=-be
-endif
-ifeq ($(strip $(BR2_sh4eb)),y)
-SQUASHFS_ENDIANNESS=-be
-endif
-ifeq ($(strip $(BR2_sparc)),y)
-SQUASHFS_ENDIANNESS=-be
-endif
 
 SQUASHFS_TARGET:=$(IMAGE).squashfs
 
