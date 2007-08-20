From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 10:21:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: at boa customize
	diffutils dillo ethtool etc...
Message-ID: <20070820172116.05914A45E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 10:21:16 -0700 (Mon, 20 Aug 2007)
New Revision: 19592

Log:
SED away some whitespace

Modified:
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/customize/customize.mk
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/dillo/dillo.mk
   trunk/buildroot/package/ethtool/ethtool.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/haserl/haserl.mk
   trunk/buildroot/package/imagemagick/imagemagick.mk
   trunk/buildroot/package/libcgi/libcgi.mk
   trunk/buildroot/package/libgcrypt/libgcrypt.mk
   trunk/buildroot/package/libgpg-error/libgpg-error.mk
   trunk/buildroot/package/libmad/libmad.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/libxml2/libxml2.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/mpg123/mpg123.mk
   trunk/buildroot/package/nbd/nbd.mk
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/package/vpnc/vpnc.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/at/at.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -63,7 +63,7 @@
 at-dirclean:
 	rm -rf $(AT_DIR)
 
-.PHONY:	at
+.PHONY: at
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/boa/boa.mk
===================================================================
--- trunk/buildroot/package/boa/boa.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/boa/boa.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -18,7 +18,7 @@
 $(DL_DIR)/$(BOA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(BOA_SITE)/$(BOA_SOURCE)
 
-$(BOA_DIR)/.unpacked:	$(DL_DIR)/$(BOA_SOURCE)
+$(BOA_DIR)/.unpacked: $(DL_DIR)/$(BOA_SOURCE)
 	$(BOA_CAT) $(DL_DIR)/$(BOA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(BOA_DIR)/.unpacked
 
@@ -48,7 +48,7 @@
 	);
 	touch $(BOA_WORKDIR)/Makefile
 
-$(BOA_WORKDIR)/src/boa $(BOA_WORKDIR)/src/boa_indexer:	$(BOA_WORKDIR)/Makefile
+$(BOA_WORKDIR)/src/boa $(BOA_WORKDIR)/src/boa_indexer: $(BOA_WORKDIR)/Makefile
 	rm -f $@
 	$(MAKE) -C $(BOA_WORKDIR)
 
@@ -63,7 +63,7 @@
 	$(STRIP) --strip-all $(TARGET_DIR)/usr/sbin/boa $(TARGET_DIR)/usr/lib/boa/boa_indexer
 	touch $(BOA_WORKDIR)/.installed
 
-boa:	uclibc $(BOA_WORKDIR)/.installed
+boa: uclibc $(BOA_WORKDIR)/.installed
 
 boa-source: $(DL_DIR)/$(BOA_SOURCE)
 

Modified: trunk/buildroot/package/customize/customize.mk
===================================================================
--- trunk/buildroot/package/customize/customize.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/customize/customize.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -21,7 +21,7 @@
 customize-clean:
 	rm -f $(BUILD_DIR)/.customize
 
-.PHONY:	customize
+.PHONY: customize
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/diffutils/diffutils.mk
===================================================================
--- trunk/buildroot/package/diffutils/diffutils.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/diffutils/diffutils.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -109,7 +109,7 @@
 
 diffutils: uclibc $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY)
 
-diff-utils-unpacked:	$(DIFFUTILS_DIR)/.unpacked
+diff-utils-unpacked: $(DIFFUTILS_DIR)/.unpacked
 
 diffutils-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR) uninstall

Modified: trunk/buildroot/package/dillo/dillo.mk
===================================================================
--- trunk/buildroot/package/dillo/dillo.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/dillo/dillo.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -39,7 +39,7 @@
 	$(MAKE) -C $(DILLO_DIR) DESTDIR=$(TARGET_DIR) install
 	touch $(DILLO_DIR)/.installed
 
-dillo:	uclibc $(XSERVER) libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
+dillo: uclibc $(XSERVER) libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
 
 dillo-source: $(DL_DIR)/$(DILLO_SOURCE)
 

Modified: trunk/buildroot/package/ethtool/ethtool.mk
===================================================================
--- trunk/buildroot/package/ethtool/ethtool.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/ethtool/ethtool.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -37,7 +37,7 @@
 	cp $(ETHTOOL_DIR)/ethtool $(TARGET_DIR)/usr/sbin
 	touch $@
 
-ethtool:	uclibc $(ETHTOOL_DIR)/.installed
+ethtool: uclibc $(ETHTOOL_DIR)/.installed
 
 ethtool-source: $(DL_DIR)/$(ETHTOOL_SOURCE)
 

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -90,13 +90,13 @@
 	$(MAKE) -C $(FREETYPE_DIR1) install
 	touch -c $@
 
-.PHONY:	freetype freetype-source freetype-links freetype-clean freetype-dirclean
+.PHONY: freetype freetype-source freetype-links freetype-clean freetype-dirclean
 
 freetype: uclibc pkgconfig $(TARGET_DIR)/lib/libfreetype.so freetype-links
 
 freetype-source: $(DL_DIR)/$(FREETYPE_SOURCE)
 
-freetype-links:	$(STAGING_DIR)/usr/include/freetype $(STAGING_DIR)/include/freetype
+freetype-links: $(STAGING_DIR)/usr/include/freetype $(STAGING_DIR)/include/freetype
 
 freetype-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FREETYPE_DIR) uninstall
@@ -105,7 +105,7 @@
 freetype-dirclean:
 	rm -rf $(FREETYPE_DIR)
 
-.PHONY:	host-freetype
+.PHONY: host-freetype
 
 host-freetype: $(FREETYPE_HOST_DIR)/lib/libfreetype.so
 

Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/haserl/haserl.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -37,7 +37,7 @@
 	cp $(HASERL_DIR)/src/haserl $(TARGET_DIR)/usr/bin
 	touch $@
 
-haserl:	uclibc $(HASERL_DIR)/.installed
+haserl: uclibc $(HASERL_DIR)/.installed
 
 haserl-source: $(DL_DIR)/$(HASERL_SOURCE)
 

Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -76,7 +76,7 @@
 	-$(STRIP) --strip-unneeded $(IMAGEMAGICK_LIB)*
 	touch -c $@
 
-$(IMAGEMAGICK_DIR)/.libinstall:	$(IMAGEMAGICK_LIB)
+$(IMAGEMAGICK_DIR)/.libinstall: $(IMAGEMAGICK_LIB)
 	libtool	--finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/coders
 	libtool	--finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/filters
 	touch	$@
@@ -122,7 +122,7 @@
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/montage
 	touch	$@
 
-$(TARGET_DIR)/usr/bin/convert:	$(IMAGEMAGICK_LIB)
+$(TARGET_DIR)/usr/bin/convert: $(IMAGEMAGICK_LIB)
 	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-convert $(TARGET_DIR)/usr/bin/convert
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/convert
 	touch	$@

Modified: trunk/buildroot/package/libcgi/libcgi.mk
===================================================================
--- trunk/buildroot/package/libcgi/libcgi.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/libcgi/libcgi.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -63,7 +63,7 @@
 libcgi-dirclean:
 	rm -rf $(LIBCGI_DIR)
 
-.PHONY:	libcgi
+.PHONY: libcgi
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/libgcrypt/libgcrypt.mk
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -65,7 +65,7 @@
 libgcrypt-dirclean:
 	rm -rf $(LIBGCRYPT_DIR)
 
-.PHONY:	libgcrypt
+.PHONY: libgcrypt
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/libgpg-error/libgpg-error.mk
===================================================================
--- trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -64,7 +64,7 @@
 libgpg-error-dirclean:
 	rm -rf $(LIBGPG_ERROR_DIR)
 
-.PHONY:	libgpg-error
+.PHONY: libgpg-error
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -51,7 +51,7 @@
 	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/lib/libmad.*a $(TARGET_DIR)/usr/lib/
 
-libmad:	uclibc $(TARGET_DIR)/usr/lib/libmad.so
+libmad: uclibc $(TARGET_DIR)/usr/lib/libmad.so
 
 libmad-headers: $(TARGET_DIR)/usr/lib/libmad.a
 

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -57,7 +57,7 @@
 libusb-dirclean:
 	rm -rf $(LIBUSB_DIR)
 
-.PHONY:	libusb
+.PHONY: libusb
 
 #############################################################
 #

Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -63,16 +63,16 @@
 $(TARGET_DIR)/usr/lib/libxml2.a: $(STAGING_DIR)/usr/lib/libxml2.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libxml2.*a $(TARGET_DIR)/usr/lib/
 
-libxml2:	uclibc $(TARGET_DIR)/usr/lib/libxml2.so libxml2-headers
+libxml2: uclibc $(TARGET_DIR)/usr/lib/libxml2.so libxml2-headers
 
-$(STAGING_DIR)/usr/include/libxml:	$(TARGET_DIR)/usr/lib/libxml2.so
+$(STAGING_DIR)/usr/include/libxml: $(TARGET_DIR)/usr/lib/libxml2.so
 	cp -af $(LIBXML2_DIR)/include/libxml $(STAGING_DIR)/usr/include/libxml2
 
-$(TARGET_DIR)/usr/include/libxml2:	libxml2-headers
+$(TARGET_DIR)/usr/include/libxml2: libxml2-headers
 	cp -af $(LIBXML2_DIR)/include/libxml $(TARGET_DIR)/usr/include/libxml2
 
 
-libxml2-headers:	$(STAGING_DIR)/usr/include/libxml
+libxml2-headers: $(STAGING_DIR)/usr/include/libxml
 
 libxml2-target-headers: $(TARGET_DIR)/usr/include/libxml2 $(TARGET_DIR)/usr/lib/libxml2.a
 
@@ -89,7 +89,7 @@
 libxml2-dirclean:
 	rm -rf $(LIBXML2_DIR)
 
-.PHONY:	libxml2-headers libxml2-target-headers
+.PHONY: libxml2-headers libxml2-target-headers
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/lzma/lzma.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -55,12 +55,12 @@
 lzma-host-dirclean:
 	rm -rf $(LZMA_HOST_DIR)
 
-/usr/local/bin/lzma:	lzma_host
+/usr/local/bin/lzma: lzma_host
 	sudo 	$(MAKE) DESTDIR=/usr/local -C $(LZMA_HOST_DIR) install
 	sudo	$(SED) "s,^libdir=.*,libdir=\'/usr/local/lib\',g" \
 		/usr/local/lib/liblzmadec.la
 
-lzma-host-install:	/usr/local/bin/lzma
+lzma-host-install: /usr/local/bin/lzma
 
 ######################################################################
 #

Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/modutils/modutils.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -51,7 +51,7 @@
 	$(MAKE) prefix=$(STAGING_DIR) -C $(MODUTILS_DIR1) install-bin
 	touch -c $@
 
-$(TARGET_DIR)/sbin/rmmod:	$(STAGING_DIR)/$(MODUTILS_TARGET_BINARY)
+$(TARGET_DIR)/sbin/rmmod: $(STAGING_DIR)/$(MODUTILS_TARGET_BINARY)
 	cp -dpf $(STAGING_DIR)/sbin/depmod	$(TARGET_DIR)/sbin/depmod
 	cp -dpf $(STAGING_DIR)/sbin/insmod	$(TARGET_DIR)/sbin/insmod
 	cp -dpf $(STAGING_DIR)/sbin/modinfo	$(TARGET_DIR)/sbin/modinfo

Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -21,7 +21,7 @@
 $(DL_DIR)/$(MPG123_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MPG123_SITE)/$(MPG123_SOURCE)
 
-$(MPG123_DIR)/.unpacked:	$(DL_DIR)/$(MPG123_SOURCE)
+$(MPG123_DIR)/.unpacked: $(DL_DIR)/$(MPG123_SOURCE)
 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123\*.patch
 	$(CONFIG_UPDATE) $(MPG123_DIR)/build
@@ -53,7 +53,7 @@
 	$(INSTALL) -D $(MPG123_DIR)/src/$(MPG123_BIN) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 
-mpg123:	uclibc $(MPG123_ALSA_DEP) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
+mpg123: uclibc $(MPG123_ALSA_DEP) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 
 mpg123-clean:
 	-$(MAKE) -C $(MPG123_DIR) clean

Modified: trunk/buildroot/package/nbd/nbd.mk
===================================================================
--- trunk/buildroot/package/nbd/nbd.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/nbd/nbd.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -37,7 +37,7 @@
 	cp $< $@
 	$(STRIP) $@
 
-nbd:	uclibc $(TARGET_DIR)/sbin/nbd-client
+nbd: uclibc $(TARGET_DIR)/sbin/nbd-client
 
 nbd-source: $(DL_DIR)/$(NBD_SOURCE)
 

Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/readline/readline.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -16,7 +16,7 @@
 $(DL_DIR)/$(READLINE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(READLINE_SITE)/$(READLINE_SOURCE)
 
-readline-source:  $(DL_DIR)/$(READLINE_SOURCE)
+readline-source: $(DL_DIR)/$(READLINE_SOURCE)
 
 $(READLINE_DIR)/.unpacked: $(DL_DIR)/$(READLINE_SOURCE)
 	mkdir -p $(READLINE_DIR)

Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/sed/sed.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -71,7 +71,7 @@
 
 .PHONY: sed host-sed use-sed-host-binary
 
-use-sed-host-binary:	$(HOST_SED_DIR)/$(SED_TARGET_BINARY)
+use-sed-host-binary: $(HOST_SED_DIR)/$(SED_TARGET_BINARY)
 
 host-sed: $(HOST_SED_BINARY)
 

Modified: trunk/buildroot/package/socat/socat.mk
===================================================================
--- trunk/buildroot/package/socat/socat.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/socat/socat.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -20,7 +20,7 @@
 $(DL_DIR)/$(SOCAT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SOCAT_SITE)/$(SOCAT_SOURCE)
 
-$(SOCAT_DIR)/.unpacked:	$(DL_DIR)/$(SOCAT_SOURCE)
+$(SOCAT_DIR)/.unpacked: $(DL_DIR)/$(SOCAT_SOURCE)
 	$(SOCAT_CAT) $(DL_DIR)/$(SOCAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(SOCAT_DIR)/.unpacked
 
@@ -50,7 +50,7 @@
 	$(SED) 's/#define HAVE_TERMIOS_ISPEED 1/#undef HAVE_TERMIOS_ISPEED/g' config.h; \
 	);
 	
-$(SOCAT_WORKDIR)/socat:	$(SOCAT_WORKDIR)/Makefile
+$(SOCAT_WORKDIR)/socat: $(SOCAT_WORKDIR)/Makefile
 	rm -f $@
 	$(MAKE) -C $(SOCAT_WORKDIR)
 
@@ -59,7 +59,7 @@
 	$(MAKE) -C $(SOCAT_WORKDIR) install prefix=$(TARGET_DIR)/usr DESTDIR=$(TARGET_DIR)
 	touch $@
 
-socat:	uclibc $(SOCAT_WORKDIR)/.installed
+socat: uclibc $(SOCAT_WORKDIR)/.installed
 
 socat-source: $(DL_DIR)/$(SOCAT_SOURCE)
 

Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -62,7 +62,7 @@
 	cp -a $(STAGING_DIR)/lib/libsqlite3*.so* $(TARGET_DIR)/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libsqlite3.so*
 
-sqlite:	uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
+sqlite: uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
 
 sqlite-source: $(DL_DIR)/$(SQLITE_SOURCE)
 

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/udev/udev.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -48,7 +48,7 @@
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
 
-$(UDEV_DIR)/.target_install:	$(UDEV_DIR)/$(UDEV_BINARY)
+$(UDEV_DIR)/.target_install: $(UDEV_DIR)/$(UDEV_BINARY)
 	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0644 $(UDEV_DIR)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
 	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
@@ -62,7 +62,7 @@
 	touch $@
 
 #####################################################################
-.PHONY:	udev-source udev udev-clean udev-dirclean
+.PHONY: udev-source udev udev-clean udev-dirclean
 
 udev: uclibc $(TARGET_DIR)/$(UDEV_TARGET_BINARY) $(UDEV_DIR)/.target_install
 
@@ -80,7 +80,7 @@
 
 #####################################################################
 ifeq ($(strip $(BR2_PACKAGE_UDEV_VOLUME_ID)),y)
-.PHONY:	 udev-volume_id udev-volume_id-clean udev-volume_id-dirclean
+.PHONY: udev-volume_id udev-volume_id-clean udev-volume_id-dirclean
 
 $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION):
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
@@ -91,7 +91,7 @@
 	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/usr/lib/libvolume_id.so.0
 	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/usr/lib/libvolume_id.so
 
-$(STAGING_DIR)/usr/lib/libvolume_id.la:	$(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
+$(STAGING_DIR)/usr/lib/libvolume_id.la: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 	$(INSTALL) -m 0755 -D package/udev/libvolume_id.la.tmpl		$(STAGING_DIR)/usr/lib/libvolume_id.la
 	$(SED) 's/REPLACE_CURRENT/$(UDEV_VOLUME_ID_CURRENT)/g'		$(STAGING_DIR)/usr/lib/libvolume_id.la
 	$(SED) 's/REPLACE_AGE/$(UDEV_VOLUME_ID_AGE)/g'			$(STAGING_DIR)/usr/lib/libvolume_id.la
@@ -124,7 +124,7 @@
 
 #####################################################################
 ifeq ($(strip $(BR2_PACKAGE_UDEV_SCSI_ID)),y)
-.PHONY:	udev-scsi_id udev-scsi_id-clean udev-scsi_id-dirclean
+.PHONY: udev-scsi_id udev-scsi_id-clean udev-scsi_id-dirclean
 
 $(TARGET_DIR)/lib/udev/scsi_id: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \

Modified: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	2007-08-20 15:47:42 UTC (rev 19591)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2007-08-20 17:21:16 UTC (rev 19592)
@@ -47,7 +47,7 @@
 
 
 
-vpnc:	uclibc $(VPNC_TARGET_BINARY)
+vpnc: uclibc $(VPNC_TARGET_BINARY)
 
 vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
 
