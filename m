From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 01:06:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target: tar ubifs
Message-ID: <20081208090659.5760E3C6C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 01:06:59 -0800 (Mon, 08 Dec 2008)
New Revision: 24314

Log:
target: paths may need stripping

r24310 removed a few too many strips.

Modified:
   trunk/buildroot/target/tar/tarroot.mk
   trunk/buildroot/target/ubifs/ubifsroot.mk


Changeset:
Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2008-12-08 08:54:14 UTC (rev 24313)
+++ trunk/buildroot/target/tar/tarroot.mk	2008-12-08 09:06:59 UTC (rev 24314)
@@ -21,7 +21,7 @@
 TAR_COMPRESSOR:=lzma -9 -c
 TAR_COMPRESSOR_EXT:=lzma
 endif
-ROOTFS_TAR_COPYTO:=$(subst ",,$(BR2_TARGET_ROOTFS_TAR_COPYTO))
+ROOTFS_TAR_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_TAR_COPYTO)))
 # "))
 
 tarroot: host-fakeroot makedevs

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2008-12-08 08:54:14 UTC (rev 24313)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2008-12-08 09:06:59 UTC (rev 24314)
@@ -113,7 +113,7 @@
 	$(UBIFS_ROOTFS_COMPRESSOR) $(UBIFS_BASE) > $(UBIFS_TARGET)
 endif
 
-UBIFS_COPYTO := $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO))
+UBIFS_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO)))
 # "))
 
 ubifsroot: $(UBIFS_TARGET)
