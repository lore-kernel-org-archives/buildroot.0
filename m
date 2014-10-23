From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 23 Oct 2014 10:43:37 +0200
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
Message-ID: <1414053818-28076-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 fs/cramfs/cramfs.mk                                |    2 +-
 fs/tar/tar.mk                                      |    2 +-
 package/automake/automake.mk                       |    2 +-
 package/cramfs/cramfs.mk                           |   12 ++++----
 package/e2fsprogs/e2fsprogs.mk                     |    2 +-
 package/elfutils/elfutils.mk                       |   24 +++++++--------
 package/genromfs/genromfs.mk                       |   10 +++---
 package/i2c-tools/i2c-tools.mk                     |    2 +-
 package/libgtk2/libgtk2.mk                         |    4 +--
 package/liblog4c-localtime/liblog4c-localtime.mk   |    2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk   |   22 +++++++-------
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    4 +--
 .../matchbox-keyboard/matchbox-keyboard.mk         |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |    2 +-
 package/mtd/mtd.mk                                 |    6 ++--
 package/squashfs/squashfs.mk                       |   32 ++++++++++----------
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 toolchain/helpers.mk                               |    4 +--
 18 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 9fbb7dd..7472372 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -11,7 +11,7 @@ CRAMFS_OPTS = -l
 endif
 
 define ROOTFS_CRAMFS_CMD
- $(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
+	$(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
 endef
 
 ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index f876d03..780827e 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -7,7 +7,7 @@
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
- tar -c$(TAR_OPTS)f $@ -C $(TARGET_DIR) .
+	tar -c$(TAR_OPTS)f $@ -C $(TARGET_DIR) .
 endef
 
 $(eval $(call ROOTFS_TARGET,tar))
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 8d7e291..17bc799 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -13,7 +13,7 @@ AUTOMAKE_LICENSE_FILES = COPYING
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
 define GTK_DOC_M4_INSTALL
- $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
+	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
 endef
 
 # ensure staging aclocal dir exists
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index bcea6ef..72860b6 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -12,21 +12,21 @@ CRAMFS_LICENSE_FILES = COPYING
 CRAMFS_DEPENDENCIES = zlib
 
 define CRAMFS_BUILD_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define CRAMFS_INSTALL_TARGET_CMDS
- $(INSTALL) -D -m 755 $(@D)/mkcramfs $(TARGET_DIR)/usr/bin/mkcramfs
- $(INSTALL) -D -m 755 $(@D)/cramfsck $(TARGET_DIR)/usr/bin/cramfsck
+	$(INSTALL) -D -m 755 $(@D)/mkcramfs $(TARGET_DIR)/usr/bin/mkcramfs
+	$(INSTALL) -D -m 755 $(@D)/cramfsck $(TARGET_DIR)/usr/bin/cramfsck
 endef
 
 define HOST_CRAMFS_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS) -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS) -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)
 endef
 
 define HOST_CRAMFS_INSTALL_CMDS
- $(INSTALL) -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin/mkcramfs
- $(INSTALL) -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
+	$(INSTALL) -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin/mkcramfs
+	$(INSTALL) -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
 endef
 
 $(eval $(generic-package))
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 3260501..3961a94 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -35,7 +35,7 @@ E2FSPROGS_MAKE_OPTS = \
 	LDCONFIG=true
 
 define HOST_E2FSPROGS_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 endef
 # we don't have a host-util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 37db27a..163db96 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -38,34 +38,34 @@ ELFUTILS_CONF_ENV += \
 	LDFLAGS="$(ELFUTILS_LDFLAGS)"
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
- ELFUTILS_DEPENDENCIES += argp-standalone
+ELFUTILS_DEPENDENCIES += argp-standalone
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
- ELFUTILS_DEPENDENCIES += zlib
- ELFUTILS_CONF_OPTS += --with-zlib
+ELFUTILS_DEPENDENCIES += zlib
+ELFUTILS_CONF_OPTS += --with-zlib
 else
- ELFUTILS_CONF_OPTS += --without-zlib
+ELFUTILS_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
- ELFUTILS_DEPENDENCIES += bzip2
- ELFUTILS_CONF_OPTS += --with-bzlib
+ELFUTILS_DEPENDENCIES += bzip2
+ELFUTILS_CONF_OPTS += --with-bzlib
 else
- ELFUTILS_CONF_OPTS += --without-bzlib
+ELFUTILS_CONF_OPTS += --without-bzlib
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
- ELFUTILS_DEPENDENCIES += xz
- ELFUTILS_CONF_OPTS += --with-lzma
+ELFUTILS_DEPENDENCIES += xz
+ELFUTILS_CONF_OPTS += --with-lzma
 else
- ELFUTILS_CONF_OPTS += --without-lzma
+ELFUTILS_CONF_OPTS += --without-lzma
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
- ELFUTILS_CONF_OPTS += --enable-progs
+ELFUTILS_CONF_OPTS += --enable-progs
 else
- ELFUTILS_CONF_OPTS += --disable-progs
+ELFUTILS_CONF_OPTS += --disable-progs
 endif
 
 $(eval $(autotools-package))
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 2d50a52..4b64f39 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -10,14 +10,14 @@ GENROMFS_LICENSE = GPLv2+
 GENROMFS_LICENSE_FILES = COPYING
 
 define GENROMFS_BUILD_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-    CC="$(TARGET_CC)" \
-    CFLAGS="$(TARGET_CFLAGS)" \
-    LDFLAGS="$(TARGET_LDFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
 endef
 
 define GENROMFS_INSTALL_TARGET_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
 endef
 
 define HOST_GENROMFS_BUILD_CMDS
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 286c868..0115e22 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -11,7 +11,7 @@ I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
 
 define I2C_TOOLS_BUILD_CMDS
- $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 7bd7b4e..6a78a98 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -165,11 +165,11 @@ HOST_LIBGTK2_CONF_OPTS = \
 		--disable-cups
 
 define HOST_LIBGTK2_BUILD_CMDS
- $(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
+	$(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
 endef
 
 define HOST_LIBGTK2_INSTALL_CMDS
- cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
+	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
 endef
 
 $(eval $(autotools-package))
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index fd0f8f8..4af9ee5 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -19,4 +19,4 @@ endef
 
 LIBLOG4C_LOCALTIME_PRE_CONFIGURE_HOOKS += LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
 
- $(eval $(autotools-package))
+$(eval $(autotools-package))
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index a07f0a0..5c2ac54 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -12,23 +12,23 @@ LIBXML_PARSER_PERL_LICENSE = Artistic or GPLv1+
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
- (cd $(@D) ; \
-   $(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
-        PREFIX=$(HOST_DIR)/usr \
-        EXPATLIBPATH=$(HOST_DIR)/usr/lib \
-        EXPATINCPATH=$(HOST_DIR)/usr/include \
-        INSTALLDIRS=site \
-        INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
-        INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
- )
+	(cd $(@D) ; \
+		$(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
+			PREFIX=$(HOST_DIR)/usr \
+			EXPATLIBPATH=$(HOST_DIR)/usr/lib \
+			EXPATINCPATH=$(HOST_DIR)/usr/include \
+			INSTALLDIRS=site \
+			INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
+			INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
+	)
 endef
 
 define HOST_LIBXML_PARSER_PERL_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index a7ad790..f687ca0 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -14,8 +14,8 @@ MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPTS = --enable-expat
 
 define MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
- $(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
- $(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' $(MATCHBOX_FAKEKEY_DIR)/Makefile
+	$(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
+	$(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' $(MATCHBOX_FAKEKEY_DIR)/Makefile
 endef
 
 MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 87e49e3..44943b3 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -15,7 +15,7 @@ MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expa
 MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
- cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
+	cp -dpf ./package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
 endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 8b1eacd..183b360 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -15,7 +15,7 @@ MATCHBOX_LIB_CONF_OPTS = --enable-expat --disable-doxygen-docs
 MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
- $(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
+	$(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
 endef
 
 MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 1d92f81..3397ebc 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -95,9 +95,9 @@ define MTD_INSTALL_STAGING_CMDS
 endef
 
 define MTD_INSTALL_TARGET_CMDS
- for f in $(MTD_TARGETS_y) ; do \
-  $(INSTALL) -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
- done
+	for f in $(MTD_TARGETS_y) ; do \
+		$(INSTALL) -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
+	done
 endef
 
 $(eval $(generic-package))
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 58dcb62..8ca9e2e 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -60,31 +60,31 @@ HOST_SQUASHFS_MAKE_ARGS = \
 	LZMA_XZ_SUPPORT=1
 
 define SQUASHFS_BUILD_CMDS
- $(TARGET_MAKE_ENV) $(MAKE)    \
-   CC="$(TARGET_CC)"           \
-   EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
-   EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-   $(SQUASHFS_MAKE_ARGS) \
-   -C $(@D)/squashfs-tools/
+	$(TARGET_MAKE_ENV) $(MAKE)    \
+		CC="$(TARGET_CC)"           \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(SQUASHFS_MAKE_ARGS) \
+		-C $(@D)/squashfs-tools/
 endef
 
 define SQUASHFS_INSTALL_TARGET_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) $(SQUASHFS_MAKE_ARGS) \
-   -C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
+	$(TARGET_MAKE_ENV) $(MAKE) $(SQUASHFS_MAKE_ARGS) \
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
 endef
 
 define HOST_SQUASHFS_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) \
-   CC="$(HOSTCC)" \
-   EXTRA_CFLAGS="$(HOST_CFLAGS)"   \
-   EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
-   $(HOST_SQUASHFS_MAKE_ARGS) \
-   -C $(@D)/squashfs-tools/
+	$(HOST_MAKE_ENV) $(MAKE) \
+		CC="$(HOSTCC)" \
+		EXTRA_CFLAGS="$(HOST_CFLAGS)"   \
+		EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
+		$(HOST_SQUASHFS_MAKE_ARGS) \
+		-C $(@D)/squashfs-tools/
 endef
 
 define HOST_SQUASHFS_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) $(HOST_SQUASHFS_MAKE_ARGS) \
-   -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_SQUASHFS_MAKE_ARGS) \
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
 $(eval $(generic-package))
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 9ea2e1d..f118ef2 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -72,7 +72,7 @@ ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive --enable-xfbdev \
 		--disable-glx --disable-dri --disable-xsdl
 define XSERVER_CREATE_X_SYMLINK
- ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
+	ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
 endef
 XSERVER_XORG_SERVER_POST_INSTALL_TARGET_HOOKS += XSERVER_CREATE_X_SYMLINK
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 8eb71ef..3121da4 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -48,7 +48,7 @@ copy_toolchain_lib_root = \
 	ARCH_LIB_DIR="$(strip $3)" ; \
 	LIB="$(strip $4)"; \
 	DESTDIR="$(strip $5)" ; \
- \
+\
 	for dir in \
 		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
 		$${ARCH_SYSROOT_DIR}/usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
@@ -80,7 +80,7 @@ copy_toolchain_lib_root = \
 			LIBPATH="`readlink -f $${LIBPATH}`"; \
 		done; \
 	done; \
- \
+\
 	echo -n
 
 #
-- 
1.7.9.5
