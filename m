From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 12:33:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/fusion
	package/imagemagick packa etc...
Message-ID: <20070821193301.14669A470E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 12:33:00 -0700 (Tue, 21 Aug 2007)
New Revision: 19628

Log:
- fixup whitespace damage after ulf


Modified:
   trunk/buildroot/package/fusion/fusion.mk
   trunk/buildroot/package/imagemagick/imagemagick.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/package/fusion/fusion.mk
===================================================================
--- trunk/buildroot/package/fusion/fusion.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/package/fusion/fusion.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -21,7 +21,7 @@
 	cp -dpf package/fusion/fusion.h $(LINUX_FUSION_HEADER)
 
 $(LINUX_FUSION_DIR)/$(LINUX_FUSION):
-	mkdir	-p $(LINUX_FUSION_DIR)
+	mkdir -p $(LINUX_FUSION_DIR)
 	cp -dpf package/fusion/40-fusion.rules $(LINUX_FUSION_DIR)
 	touch -c $@
 

Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -77,58 +77,58 @@
 	touch -c $@
 
 $(IMAGEMAGICK_DIR)/.libinstall: $(IMAGEMAGICK_LIB)
-	libtool	--finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/coders
-	libtool	--finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/filters
-	touch	$@
+	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/coders
+	libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/filters
+	touch $@
 
 $(TARGET_DIR)/usr/bin/animate: $(IMAGEMAGICK_LIB)
 	ls -l $(IMAGEMAGICK_LIB) >> datefile
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-animate $(TARGET_DIR)/usr/bin/animate
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/animate
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/compare: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-compare $(TARGET_DIR)/usr/bin/compare
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/compare
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/composite: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-composite $(TARGET_DIR)/usr/bin/composite
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/composite
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/conjure: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-conjure $(TARGET_DIR)/usr/bin/conjure
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/conjure
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/display: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-display $(TARGET_DIR)/usr/bin/display
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/display
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/import: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-import $(TARGET_DIR)/usr/bin/import
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/import
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/mogrify: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-mogrify $(TARGET_DIR)/usr/bin/mogrify
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/mogrify
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/montage: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-montage $(TARGET_DIR)/usr/bin/montage
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/montage
-	touch	$@
+	touch $@
 
 $(TARGET_DIR)/usr/bin/convert: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-convert $(TARGET_DIR)/usr/bin/convert
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/convert
-	touch	$@
+	touch $@
 
 imagemagick: uclibc jpeg tiff $(IMAGEMAGICK_LIB) \
-		$(IMAGEMAGICK_DIR)/.libinstall	\
+		$(IMAGEMAGICK_DIR)/.libinstall \
 		$(IMAGEMAGICK_TARGET_BINARIES)
 
 imagemagick-clean:

Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -26,7 +26,7 @@
 $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
-	mkdir	-p $(PROJECT_BUILD_DIR)/patches
+	mkdir -p $(PROJECT_BUILD_DIR)/patches
 	$(BZCAT) package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
 		> $(PROJECT_BUILD_DIR)/patches/$(LIBDAEMON_NAME).patch
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) $(PROJECT_BUILD_DIR)/patches/ $(LIBDAEMON_NAME)\*.patch

Modified: trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
===================================================================
--- trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -47,7 +47,7 @@
 	# etc
 	$(INSTALL) -m 0644 -D package/mdnsresponder/mDNSResponderPosix.conf $(TARGET_DIR)/etc/	
 	# init
-	$(INSTALL) -m 0755 -D package/mdnsresponder/rc.mdnsresponder $(TARGET_DIR)/etc/init.d/S80mdnsresponder	
+	$(INSTALL) -m 0755 -D package/mdnsresponder/rc.mdnsresponder $(TARGET_DIR)/etc/init.d/S80mdnsresponder
 
 $(TARGET_DIR)/usr/bin/mDNSClientPosix: $(STAGING_DIR)/usr/lib/libdns_sd.so
 	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSNetMonitor $(TARGET_DIR)/usr/sbin/

Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/package/modutils/modutils.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -52,17 +52,15 @@
 	touch -c $@
 
 $(TARGET_DIR)/sbin/rmmod: $(STAGING_DIR)/$(MODUTILS_TARGET_BINARY)
-	cp -dpf $(STAGING_DIR)/sbin/depmod	$(TARGET_DIR)/sbin/depmod
-	cp -dpf $(STAGING_DIR)/sbin/insmod	$(TARGET_DIR)/sbin/insmod
-	cp -dpf $(STAGING_DIR)/sbin/modinfo	$(TARGET_DIR)/sbin/modinfo
-	ln -s	insmod $(TARGET_DIR)/sbin/kallsyms
-	ln -s	insmod $(TARGET_DIR)/sbin/ksyms
-	ln -s	insmod $(TARGET_DIR)/sbin/lsmod
-	ln -s	insmod $(TARGET_DIR)/sbin/modprobe
-	ln -s	insmod $(TARGET_DIR)/sbin/rmmod
+	cp -dpf $(STAGING_DIR)/sbin/depmod $(TARGET_DIR)/sbin/depmod
+	cp -dpf $(STAGING_DIR)/sbin/insmod $(TARGET_DIR)/sbin/insmod
+	cp -dpf $(STAGING_DIR)/sbin/modinfo $(TARGET_DIR)/sbin/modinfo
+	ln -s insmod $(TARGET_DIR)/sbin/kallsyms
+	ln -s insmod $(TARGET_DIR)/sbin/ksyms
+	ln -s insmod $(TARGET_DIR)/sbin/lsmod
+	ln -s insmod $(TARGET_DIR)/sbin/modprobe
+	ln -s insmod $(TARGET_DIR)/sbin/rmmod
 
-
-
 modutils: uclibc $(TARGET_DIR)/sbin/rmmod
 
 modutils-source: $(DL_DIR)/$(MODUTILS_SOURCE)

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -52,7 +52,7 @@
 	touch -c $@
 
 NFS_UTILS_TARGETS_  :=
-NFS_UTILS_TARGETS_y :=	usr/sbin/exportfs usr/sbin/rpc.mountd	\
+NFS_UTILS_TARGETS_y :=	usr/sbin/exportfs usr/sbin/rpc.mountd \
 			usr/sbin/rpc.nfsd usr/sbin/rpc.statd
 
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG)	+= usr/sbin/rpcdebug

Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/target/Makefile.in	2007-08-21 19:33:00 UTC (rev 19628)
@@ -18,11 +18,11 @@
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
 
-ifeq	($(strip $(subst ",,$(BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG))),y)
+ifeq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG))),y)
 #"))
-include	target/linux/Makefile.in
-#include	target/linux-experimental/Makefile.in
+include target/linux/Makefile.in
+#include target/linux-experimental/Makefile.in
 else
-include	target/linux/Makefile.in
+include target/linux/Makefile.in
 endif
 

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/toolchain/Config.in	2007-08-21 19:33:00 UTC (rev 19628)
@@ -1,4 +1,4 @@
-menu	"Toolchain type"
+menu "Toolchain type"
 choice
 	prompt "Toolchain type"
 	default BR2_TOOLCHAIN_BUILDROOT

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -33,7 +33,7 @@
 
 
 # redefine if using an external prepatched gcc source
-ifeq	($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
 endif
@@ -41,7 +41,7 @@
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 
-ifeq	($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 ifeq ($(GCC_SNAP_DATE),)
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -30,26 +30,26 @@
 endif
 
 # redefine if using an external prepatched gcc source
-ifeq	($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
 endif
 
 # define patch location
-ifeq	($(BR2_TOOLCHAIN_NORMAL),y)	# Normal toolchain
-ifeq ($(GCC_SNAP_DATE),)		# Not a snapshot
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y) # Normal toolchain
+ifeq ($(GCC_SNAP_DATE),) # Not a snapshot
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
-else					# Is a snapshot
-ifneq ($(wildcard toolchain/gcc/$(GCC_OFFICIAL_VER)),)	# Snapshot patch?
+else # Is a snapshot
+ifneq ($(wildcard toolchain/gcc/$(GCC_OFFICIAL_VER)),) # Snapshot patch?
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_OFFICIAL_VER)
-else					# Normal patch to snapshot
+else # Normal patch to snapshot
 # Use the normal location, if the dedicated location does not exist
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
-endif					# Snapshot patch
-endif					# Not a snapshot
-else					# Prepatched toolchain
+endif # Snapshot patch
+endif # Not a snapshot
+else # Prepatched toolchain
 GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
-endif					# Normal toolchain
+endif # Normal toolchain
 
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-08-21 19:20:18 UTC (rev 19627)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-08-21 19:33:00 UTC (rev 19628)
@@ -20,7 +20,7 @@
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
 
-ifeq	($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 GDB_SITE:=http://ftp.gnu.org/gnu/gdb
 else
 GDB_SITE:=$(VENDOR_SITE)
@@ -31,7 +31,7 @@
 GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
-ifeq	($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
 else
 GDB_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gdb-$(GDB_OFFICIAL_VERSION)
