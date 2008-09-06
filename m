From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/libmad
Message-ID: <20080906204931.721633C6DB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:31 -0700 (Sat, 06 Sep 2008)
New Revision: 23346

Log:
libmad: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/audio/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/audio/libmad/libmad.mk	2008-09-06 20:49:28 UTC (rev 23345)
+++ trunk/buildroot/package/audio/libmad/libmad.mk	2008-09-06 20:49:31 UTC (rev 23346)
@@ -16,8 +16,8 @@
 $(LIBMAD_DIR)/.unpacked: $(DL_DIR)/$(LIBMAD_SOURCE)
 	$(LIBMAD_CAT) $(DL_DIR)/$(LIBMAD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(LIBMAD_DIR)
-	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/ libmad-$(LIBMAD_VERSION)\*.patch
-	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/ libmad-$(LIBMAD_VERSION)\*.patch.$(ARCH)
+	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/audio/libmad/ libmad-$(LIBMAD_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/audio/libmad/ libmad-$(LIBMAD_VERSION)\*.patch.$(ARCH)
 	# Prevent automake from running.
 	(cd $(LIBMAD_DIR); touch -c config* aclocal.m4 Makefile*);
 	touch $@
