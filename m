From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 31 Mar 2008 21:52:30 -0700 (PDT)
Subject: [Buildroot]  [PATCH] ignore errors in target-clean for directfb,
 file, gettext, libdrm, lzo...
Message-ID: <16412845.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Below is a patch to ignore errors in target-clean target

Regards
Gururaja

Log: 
ignore errors in target-clean target 


Modified files:
package/directfb/directfb.mk
package/file/file.mk
package/gettext/gettext.mk
package/libdrm/libdrm.mk
package/lzo/lzo.mk
package/pkgconfig/pkgconfig.mk
package/tslib/tslib.mk
package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
target/u-boot/Makefile.in


diff -purN buildroot/package/directfb/directfb.mk
buildroot_changed/package/directfb/directfb.mk
--- buildroot/package/directfb/directfb.mk	2008-03-31 03:15:30.000000000
-0400
+++ buildroot_changed/package/directfb/directfb.mk	2008-04-01
17:33:58.000000000 -0400
@@ -108,7 +108,7 @@ directfb: uclibc jpeg libpng freetype li
 		$(TARGET_DIR)/usr/lib/libdirectfb.so
 
 directfb-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR)
uninstall
 	-$(MAKE) -C $(DIRECTFB_DIR) clean
 
 directfb-dirclean:

diff -purN buildroot/package/file/file.mk
buildroot_changed/package/file/file.mk
--- buildroot/package/file/file.mk	2008-03-31 03:15:55.000000000 -0400
+++ buildroot_changed/package/file/file.mk	2008-04-01 19:33:07.000000000
-0400
@@ -105,7 +105,7 @@ endif
 file: zlib uclibc $(TARGET_DIR)/$(FILE_TARGET_BINARY)
 
 file-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FILE_DIR2) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FILE_DIR2) uninstall
 	-$(MAKE) -C $(FILE_DIR2) clean
 
 file-dirclean:

diff -purN buildroot/package/gettext/gettext.mk
buildroot_changed/package/gettext/gettext.mk
--- buildroot/package/gettext/gettext.mk	2008-03-31 03:15:50.000000000 -0400
+++ buildroot_changed/package/gettext/gettext.mk	2008-04-01
19:33:45.000000000 -0400
@@ -125,7 +125,7 @@ gettext: uclibc pkgconfig $(STAGING_DIR)
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
 
 gettext-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
 	-$(MAKE) -C $(GETTEXT_DIR) clean
 
 gettext-dirclean:

diff -purN buildroot/package/libdrm/libdrm.mk
buildroot_changed/package/libdrm/libdrm.mk
--- buildroot/package/libdrm/libdrm.mk	2008-03-31 03:15:41.000000000 -0400
+++ buildroot_changed/package/libdrm/libdrm.mk	2008-04-01 19:34:21.000000000
-0400
@@ -64,7 +64,7 @@ $(TARGET_DIR)/usr/lib/libdrm.so: $(STAGI
 libdrm: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libdrm.so
 
 libdrm-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBDRM_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBDRM_DIR) uninstall
 	-$(MAKE) -C $(LIBDRM_DIR) clean
 
 libdrm-dirclean:

diff -purN buildroot/package/lzo/lzo.mk buildroot_changed/package/lzo/lzo.mk
--- buildroot/package/lzo/lzo.mk	2008-03-31 03:15:55.000000000 -0400
+++ buildroot_changed/package/lzo/lzo.mk	2008-04-01 19:38:47.000000000 -0400
@@ -54,7 +54,7 @@ $(STAGING_DIR)/usr/lib/liblzo.a: $(LZO_D
 lzo: uclibc $(STAGING_DIR)/usr/lib/liblzo.a
 
 lzo-clean:
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) uninstall
+	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) uninstall
 	-$(MAKE) -C $(LZO_DIR) clean
 
 lzo-dirclean:

diff -purN buildroot/package/pkgconfig/pkgconfig.mk
buildroot_changed/package/pkgconfig/pkgconfig.mk
--- buildroot/package/pkgconfig/pkgconfig.mk	2008-03-31 03:16:03.000000000
-0400
+++ buildroot_changed/package/pkgconfig/pkgconfig.mk	2008-04-01
19:39:20.000000000 -0400
@@ -55,7 +55,7 @@ $(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY
 pkgconfig: uclibc $(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY)
 
 pkgconfig-clean:
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) uninstall
+	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) uninstall
 	-$(MAKE) -C $(PKGCONFIG_DIR) clean
 
 pkgconfig-dirclean:

diff -purN buildroot/package/tslib/tslib.mk
buildroot_changed/package/tslib/tslib.mk
--- buildroot/package/tslib/tslib.mk	2008-03-31 03:15:53.000000000 -0400
+++ buildroot_changed/package/tslib/tslib.mk	2008-04-01 19:40:20.000000000
-0400
@@ -91,7 +91,7 @@ tslib-build: uclibc $(TSLIB_DIR)/.config
 	touch $(TSLIB_DIR)/.compiled
 
 tslib-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(TSLIB_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(TSLIB_DIR) uninstall
 	rm -f $(STAGING_DIR)/lib/libts.*
 	rm -f $(STAGING_DIR)/usr/lib/libts.*
 	-$(MAKE) -C $(TSLIB_DIR) clean

diff -purN
buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
buildroot_changed/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
--- buildroot/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
2008-03-31 03:15:37.000000000 -0400
+++
buildroot_changed/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
2008-04-01 20:03:00.000000000 -0400
@@ -58,8 +58,8 @@ $(XDATA_XCURSOR_THEMES_DIR)/.installed: 
 	touch $@
 
 xdata_xcursor-themes-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
+	-$(MAKE) prefix=$(STAGING_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR)
uninstall
+	-$(MAKE) prefix=$(TARGET_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
 	-$(MAKE) -C $(XDATA_XCURSOR_THEMES_DIR) clean
 	-rm $(XDATA_XCURSOR_THEMES_DIR)/.installed
 	-rm $(XDATA_XCURSOR_THEMES_DIR)/.built

diff -purN buildroot/target/u-boot/Makefile.in
buildroot_changed/target/u-boot/Makefile.in
--- buildroot/target/u-boot/Makefile.in	2008-03-31 03:15:25.000000000 -0400
+++ buildroot_changed/target/u-boot/Makefile.in	2008-04-01
20:04:02.000000000 -0400
@@ -113,7 +113,7 @@ $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_
 u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN)
 
 u-boot-clean:
-	$(MAKE) -C $(U_BOOT_DIR) clean
+	-$(MAKE) -C $(U_BOOT_DIR) clean
 
 u-boot-dirclean:
 	rm -rf $(U_BOOT_DIR)


-- 
View this message in context: http://www.nabble.com/-PATCH--ignore-errors-in-target-clean-for-directfb%2C-file%2Cgettext%2C-libdrm%2Clzo...-tp16412845p16412845.html
Sent from the BuildRoot mailing list archive at Nabble.com.
