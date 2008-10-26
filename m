From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 12:57:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dbus-glib gqview
	hal java/classpath java etc...
Message-ID: <20081026195755.C960A3C67D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 12:57:55 -0700 (Sun, 26 Oct 2008)
New Revision: 23805

Log:
package: remove redundant pkg-config variables

Also remove some redundant or predefined configure/make args in these
packages.

Patch by Markus Heidelberg.

Modified:
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/gqview/gqview.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/java/jamvm/jamvm.mk
   trunk/buildroot/package/kismet/kismet.mk
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/midori/midori.mk
   trunk/buildroot/package/pcmanfm/pcmanfm.mk
   trunk/buildroot/package/sylpheed/sylpheed.mk


Changeset:
Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -32,13 +32,11 @@
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
-		PKG_CONFIG=/usr/bin/pkg-config \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
 		--localstatedir=/var \
 		--program-prefix="" \
 		--disable-tests \

Modified: trunk/buildroot/package/gqview/gqview.mk
===================================================================
--- trunk/buildroot/package/gqview/gqview.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/gqview/gqview.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -10,8 +10,6 @@
 GQVIEW_INSTALL_STAGING = NO
 GQVIEW_INSTALL_TARGET = YES
 
-GQVIEW_CONF_OPT = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
-
 GQVIEW_DEPENDENCIES = uclibc pkgconfig libgtk2
 
 $(eval $(call AUTOTARGETS,package,gqview))

Modified: trunk/buildroot/package/hal/hal.mk
===================================================================
--- trunk/buildroot/package/hal/hal.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/hal/hal.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -40,14 +40,12 @@
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		VOLUME_ID_CFLAGS="$(TARGET_CFLAGS)" \
 		VOLUME_ID_LIBS="$(STAGING_DIR)/usr/lib/libvolume_id.so" \
-		PKG_CONFIG=/usr/bin/pkg-config \
 		ac_cv_path_LIBUSB_CONFIG= \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--datadir=/usr/share \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--with-hwdata=$(TARGET_DIR)/usr/share/hwdata \

Modified: trunk/buildroot/package/java/classpath/classpath.mk
===================================================================
--- trunk/buildroot/package/java/classpath/classpath.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/java/classpath/classpath.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -29,7 +29,7 @@
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
 		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
 		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
@@ -45,17 +45,12 @@
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
 
-CLASSPATH_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libdir=/usr/lib \
-		--libexecdir=/usr/lib --sysconfdir=/etc \
-		--datadir=/usr/share --localstatedir=/var \
-		--includedir=/usr/include --mandir=/usr/man \
+CLASSPATH_CONF_OPT = \
+		--libexecdir=/usr/lib --localstatedir=/var --mandir=/usr/man \
 		--infodir=/usr/info --enable-shared \
 		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
-		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--disable-debug \
 		--disable-gconf-peer --disable-examples --disable-plugin
 
 CLASSPATH_DEPENDENCIES = uclibc pkgconfig png jpeg tiff

Modified: trunk/buildroot/package/java/jamvm/jamvm.mk
===================================================================
--- trunk/buildroot/package/java/jamvm/jamvm.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/java/jamvm/jamvm.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -9,7 +9,6 @@
 JAMVM_AUTORECONF = NO
 JAMVM_INSTALL_STAGING = YES
 JAMVM_INSTALL_TARGET = YES
-JAMVM_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 JAMVM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
@@ -28,7 +27,7 @@
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
 		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
 		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
@@ -43,18 +42,12 @@
 		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
-JAMVM_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libdir=/usr/lib \
-		--libexecdir=/usr/lib --sysconfdir=/etc \
-		--datadir=/usr/share --localstatedir=/var \
-		--includedir=/usr/include --mandir=/usr/man \
+JAMVM_CONF_OPT = \
+		--libexecdir=/usr/lib --localstatedir=/var --mandir=/usr/man \
 		--infodir=/usr/info --enable-shared \
 		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
-		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-		--with-classpath-install-dir=/usr \
+		--disable-debug --with-classpath-install-dir=/usr
 
 
 JAMVM_DEPENDENCIES = uclibc pkgconfig classpath

Modified: trunk/buildroot/package/kismet/kismet.mk
===================================================================
--- trunk/buildroot/package/kismet/kismet.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/kismet/kismet.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -29,19 +29,14 @@
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
-		PKG_CONFIG=/usr/bin/pkg-config \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
 		--libdir=/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \

Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -214,7 +214,7 @@
 $(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked xlib_libXext-install-staging
 	(cd $(MATCHBOX_LIB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -241,7 +241,7 @@
 $(MATCHBOX_SNOTIFY_DIR)/.configured: $(MATCHBOX_SNOTIFY_DIR)/.unpacked
 	(cd $(MATCHBOX_SNOTIFY_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	lf_cv_sane_realloc=no \
 	./configure \
@@ -264,7 +264,7 @@
 $(MATCHBOX_WM_DIR)/.configured: $(MATCHBOX_WM_DIR)/.unpacked
 	(cd $(MATCHBOX_WM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -291,7 +291,7 @@
 $(MATCHBOX_SM_DIR)/.configured: $(MATCHBOX_SM_DIR)/.unpacked
 	(cd $(MATCHBOX_SM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -317,7 +317,7 @@
 $(MATCHBOX_CN_DIR)/.configured: $(MATCHBOX_CN_DIR)/.unpacked
 	(cd $(MATCHBOX_CN_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -342,7 +342,7 @@
 $(MATCHBOX_PL_DIR)/.configured: $(MATCHBOX_PL_DIR)/.unpacked
 	(cd $(MATCHBOX_PL_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -368,7 +368,7 @@
 $(MATCHBOX_DP_DIR)/.configured: $(MATCHBOX_DP_DIR)/.unpacked
 	(cd $(MATCHBOX_DP_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -394,7 +394,7 @@
 $(MATCHBOX_FK_DIR)/.configured: $(MATCHBOX_FK_DIR)/.unpacked
 	(cd $(MATCHBOX_FK_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -420,7 +420,7 @@
 $(MATCHBOX_KB_DIR)/.configured: $(MATCHBOX_KB_DIR)/.unpacked
 	(cd $(MATCHBOX_KB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/metacity/metacity.mk
===================================================================
--- trunk/buildroot/package/metacity/metacity.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/metacity/metacity.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -38,7 +38,6 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
-		PKG_CONFIG=$(STAGING_DIR)/usr/bin/pkg-config \
 		GLIB_CONFIG=$(STAGING_DIR)/bin/glib-config \
 		ac_cv_func_posix_getpwuid_r=yes \
 		glib_cv_stack_grows=no \

Modified: trunk/buildroot/package/midori/midori.mk
===================================================================
--- trunk/buildroot/package/midori/midori.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/midori/midori.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -11,11 +11,6 @@
 MIDORI_INSTALL_STAGING = NO
 MIDORI_INSTALL_TARGET = YES
 
-MIDORI_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME)  --prefix=/usr --sysconfdir=/etc \
-		PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
-
-
 MIDORI_DEPENDENCIES = uclibc pkgconfig webkit libsexy $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,midori))

Modified: trunk/buildroot/package/pcmanfm/pcmanfm.mk
===================================================================
--- trunk/buildroot/package/pcmanfm/pcmanfm.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/pcmanfm/pcmanfm.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -10,7 +10,6 @@
 PCMANFM_INSTALL_STAGING = NO
 PCMANFM_INSTALL_TARGET = YES
 
-PCMANFM_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 PCMANFM_CONF_OPT = --disable-hal
 
 PCMANFM_DEPENDENCIES = uclibc pkgconfig libgtk2 gamin startup-notification

Modified: trunk/buildroot/package/sylpheed/sylpheed.mk
===================================================================
--- trunk/buildroot/package/sylpheed/sylpheed.mk	2008-10-26 19:55:20 UTC (rev 23804)
+++ trunk/buildroot/package/sylpheed/sylpheed.mk	2008-10-26 19:57:55 UTC (rev 23805)
@@ -11,7 +11,6 @@
 SYLPHEED_INSTALL_TARGET = YES
 SYLPHEED_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-SYLPHEED_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
 
 SYLPHEED_DEPENDENCIES = uclibc pkgconfig
