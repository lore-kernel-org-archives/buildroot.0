From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Feb 2013 23:38:01 +0100
Subject: [Buildroot] [RFC 3/5] packages: remove all the
	<pkg>_UNINSTALL_STAGING_CMDS commands
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360363083-28747-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes the <pkg>_UNINSTALL_STAGING_CMDS for all packages in
Buildroot's tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk                                  |    4 ----
 package/alsa-lib/alsa-lib.mk                       |    6 ------
 package/boa/boa.mk                                 |    5 -----
 package/cjson/cjson.mk                             |    5 -----
 package/ezxml/ezxml.mk                             |    5 -----
 package/lcdapi/lcdapi.mk                           |    5 -----
 package/libroxml/libroxml.mk                       |    4 ----
 package/libsvgtiny/libsvgtiny.mk                   |    5 -----
 package/linenoise/linenoise.mk                     |    6 ------
 package/linux-fusion/linux-fusion.mk               |    4 ----
 package/live555/live555.mk                         |    7 -------
 package/lm-sensors/lm-sensors.mk                   |    4 ----
 package/lua/lua.mk                                 |    6 ------
 package/luajit/luajit.mk                           |    4 ----
 package/lvm2/lvm2.mk                               |    5 -----
 package/php/php.mk                                 |    7 -------
 package/schifra/schifra.mk                         |    4 ----
 package/slang/slang.mk                             |    8 --------
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |    7 -------
 package/sqlcipher/sqlcipher.mk                     |    7 -------
 package/sqlite/sqlite.mk                           |    7 -------
 package/zlib/zlib.mk                               |    4 ----
 package/zxing/zxing.mk                             |    4 ----
 23 files changed, 123 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 4a094bc..deffec3 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -76,10 +76,6 @@ define GRUB_INSTALL_TARGET_CMDS
 	$(GRUB_INSTALL_SPLASH)
 endef
 
-define GRUB_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/sbin/grub
-endef
-
 define GRUB_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/grub
 	rm -rf $(TARGET_DIR)/boot/grub
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index ba222db..92b42fa 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -85,10 +85,4 @@ define ALSA_LIB_UNINSTALL_TARGET_CMDS
 	-rm -rf $(TARGET_DIR)/usr/share/alsa
 endef
 
-define ALSA_LIB_UNINSTALL_STAGING_CMDS
-	-rm -f $(STAGING_DIR)/usr/lib/libasound.*
-	-rm -rf $(STAGING_DIR)/usr/lib/alsa-lib
-	-rm -rf $(STAGING_DIR)/usr/share/alsa
-endef
-
 $(eval $(autotools-package))
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 1099808..1430964 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -14,11 +14,6 @@ define BOA_INSTALL_TARGET_CMDS
 	install -D -m 644 package/boa/mime.types $(TARGET_DIR)/etc/mime.types
 endef
 
-define BOA_UNINSTALL_STAGING_CMDS
-	# autotools calls uninstall-staging even if staging install
-	# isn't enabled
-endef
-
 define BOA_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/sbin/boa \
 		$(TARGET_DIR)/usr/lib/boa/ \
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ff4eb26..34a7a67 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -23,11 +23,6 @@ define CJSON_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
 endef
 
-define CJSON_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/include/cJSON.h
-	rm -f $(STAGING_DIR)/usr/lib/libcJSON.so
-endef
-
 define CJSON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/include/cJSON.h
 	rm -f $(TARGET_DIR)/usr/lib/libcJSON.so
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 8417f9b..4a9f6a8 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -23,11 +23,6 @@ define EZXML_INSTALL_TARGET_CMDS
 	install -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
 endef
 
-define EZXML_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/include/ezxml.h
-	rm -f $(STAGING_DIR)/usr/lib/libezxml.a
-endef
-
 define EZXML_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/include/ezxml.h
 	rm -f $(TARGET_DIR)/usr/lib/libezxml.a
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index 8356554..fa9958e 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -24,11 +24,6 @@ define LCDAPI_INSTALL_TARGET_CMDS
 		DESTDIR="$(TARGET_DIR)" install
 endef
 
-define LCDAPI_UNINSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR="$(STAGING_DIR)" uninstall
-endef
-
 define LCDAPI_UNINSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		DESTDIR="$(TARGET_DIR)" uninstall
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 97321da..7f2d885 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -18,10 +18,6 @@ define LIBROXML_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define LIBROXML_UNINSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
-endef
-
 define LIBROXML_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
 endef
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 1fe1343..b5b1e1c 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -18,11 +18,6 @@ define LIBSVGTINY_INSTALL_STAGING_CMDS
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
 endef
 
-define LIBSVGTINY_UNINSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
-endef
-
 define LIBSVGTINY_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index b4d17fa..a5418a5 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -20,12 +20,6 @@ define LINENOISE_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(STAGING_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_UNINSTALL_STAGING_CMDS
-	rm -f   $(STAGING_DIR)/usr/include/linenoise.h
-	rm -f   $(STAGING_DIR)/usr/lib/liblinenoise.a
-	rm -f   $(STAGING_DIR)/usr/bin/linenoise_example
-endef
-
 define LINENOISE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(TARGET_DIR)/usr/include/linenoise.h
 	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(TARGET_DIR)/usr/lib/liblinenoise.a
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 5ea7900..162c399 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -38,10 +38,6 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
 	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
 endef
 
-define LINUX_FUSION_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/include/linux/fusion.h
-endef
-
 define LINUX_FUSION_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/include/linux/fusion.h
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_FOR_FUSION)/kernel/drivers/char/fusion
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 079027e..fc33b63 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -57,13 +57,6 @@ define LIVE555_INSTALL_TARGET_CMDS
 	done
 endef
 
-define LIVE555_UNINSTALL_STAGING_CMDS
-	rm -rf $(STAGING_DIR)/usr/include/live
-	for i in $(LIVE555_LIBS_TO_INSTALL); do \
-		rm -f $(addprefix $(STAGING_DIR)/usr/lib/, `basename $$i`); \
-	done
-endef
-
 define LIVE555_UNINSTALL_TARGET_CMDS
 	for i in $(LIVE555_FILES_TO_INSTALL-); do \
 		rm -f $(addprefix $(TARGET_DIR)/usr/bin/, `basename $$i`); \
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index dc51489..1866312 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -29,10 +29,6 @@ define LM_SENSORS_INSTALL_STAGING_CMDS
 	rm -f $(addprefix $(STAGING_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
 endef
 
-define LM_SENSORS_UNINSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
-endef
-
 define LM_SENSORS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 73bd70b..9aefcde 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -111,12 +111,6 @@ LUA_INSTALLED_FILES = \
 	/usr/lib/liblua.a \
 	/usr/lib/liblua.so*
 
-define LUA_UNINSTALL_STAGING_CMDS
-	for i in $(LUA_INSTALLED_FILES); do \
-		rm -f $(STAGING_DIR)$$i; \
-	done
-endef
-
 define LUA_UNINSTALL_TARGET_CMDS
 	for i in $(LUA_INSTALLED_FILES); do \
 		rm -f $(TARGET_DIR)$$i; \
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 9636112..968fcea 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -55,10 +55,6 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
 endef
 
-define LUAJIT_UNINSTALL_STAGING_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) uninstall
-endef
-
 define LUAJIT_UNINSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) uninstall
 endef
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 49f135d..8cc10a4 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -47,11 +47,6 @@ else
 LVM2_CONF_OPT += --disable-applib
 endif
 
-define LVM2_UNINSTALL_STAGING_CMDS
-	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINS))
-	rm -f $(addprefix $(STAGING_DIR)/usr/lib/,libdevmapper.so*)
-endef
-
 define LVM2_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(LVM2_BINS))
 	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
diff --git a/package/php/php.mk b/package/php/php.mk
index a1badab..a07e84d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -221,13 +221,6 @@ endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
-define PHP_UNINSTALL_STAGING_CMDS
-	rm -rf $(STAGING_DIR)/usr/include/php
-	rm -rf $(STAGING_DIR)/usr/lib/php
-	rm -f $(STAGING_DIR)/usr/bin/php*
-	rm -f $(STAGING_DIR)/usr/share/man/man1/php*.1
-endef
-
 define PHP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/php.ini
 	rm -f $(TARGET_DIR)/usr/bin/php*
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 44d08c3..3933ddb 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -44,8 +44,4 @@ define SCHIFRA_UNINSTALL_TARGET_CMDS
 	$(RM) $(TARGET_DIR)/usr/bin/schifra_*
 endef
 
-define SCHIFRA_UNINSTALL_STAGING_CMDS
-	$(RM) $(STAGING_DIR)/usr/include/schifra_*.hpp
-endef
-
 $(eval $(generic-package))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 02f440d..39a9a69 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -31,14 +31,6 @@ define SLANG_INSTALL_TARGET_CMDS
 	(cd $(TARGET_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
 endef
 
-define SLANG_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/lib/libslang.a
-	rm -f $(STAGING_DIR)/usr/lib/libslang.so
-	rm -f $(STAGING_DIR)/usr/lib/libslang.so.1
-	rm -f $(STAGING_DIR)/usr/include/slang.h
-	rm -f $(STAGING_DIR)/usr/include/slcurses.h
-endef
-
 define SLANG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libslang.a
 	rm -f $(TARGET_DIR)/usr/lib/libslang.so
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index ad4c695..198af4c 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -21,13 +21,6 @@ define SNOWBALL_HDMISERVICE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(TARGET_DIR) install
 endef
 
-define SNOWBALL_HDMISERVICE_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/lib/hdmiservice.so
-	rm -f $(STAGING_DIR)/usr/bin/hdmistart
-	rm -f $(STAGING_DIR)/usr/include/hdmi_service_api.h
-	rm -f $(STAGING_DIR)/usr/include/hdmi_service_local.h
-endef
-
 define SNOWBALL_HDMISERVICE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/hdmiservice.so
 	rm -f $(TARGET_DIR)/usr/bin/hdmistart
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index ab78f45..091cfa4 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -46,11 +46,4 @@ define SQLCIPHER_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/include/sqlite3*.h
 endef
 
-define SQLCIPHER_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/bin/sqlite3
-	rm -f $(STAGING_DIR)/usr/lib/libsqlite3*
-	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
-	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
-endef
-
 $(eval $(autotools-package))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8eb6b2f..116f4f7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -60,11 +60,4 @@ define SQLITE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
 endef
 
-define SQLITE_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/bin/sqlite3
-	rm -f $(STAGING_DIR)/usr/lib/libsqlite3*
-	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
-	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
-endef
-
 $(eval $(autotools-package))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 37445f6..8641821 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -60,10 +60,6 @@ define HOST_ZLIB_INSTALL_CMDS
 	$(MAKE1) -C $(@D) LDCONFIG=true install
 endef
 
-define ZLIB_UNINSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
-endef
-
 define ZLIB_UNINSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) uninstall
 endef
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 851aef6..7882f6a 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -26,10 +26,6 @@ define ZXING_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) install
 endef
 
-define ZXING_UNINSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(STAGING_DIR) uninstall
-endef
-
 define ZXING_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) install
 endef
-- 
1.7.9.5
