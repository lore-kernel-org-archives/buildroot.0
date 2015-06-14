From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 11:10:30 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: Move all kodi packages to
	subdirectories of package/kodi/
Message-ID: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi 15.0 Isengard will contain new support for binary addons.
To prevent adding all those new packages to the root level of package/
introduce a new main hierarchy starting from package/kodi/.

This patch moves the current Kodi 14.2 Helix packages to this new
directory in preparation for the upcoming version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                          |    2 +-
 package/{ => kodi}/kodi-addon-xvdr/0001-xbmc-rebrand.patch |    0
 package/{ => kodi}/kodi-addon-xvdr/Config.in               |    0
 package/{ => kodi}/kodi-addon-xvdr/kodi-addon-xvdr.mk      |    0
 package/{ => kodi}/kodi-audioencoder-flac/Config.in        |    0
 .../kodi-audioencoder-flac/kodi-audioencoder-flac.mk       |    0
 package/{ => kodi}/kodi-audioencoder-lame/Config.in        |    0
 .../kodi-audioencoder-lame/kodi-audioencoder-lame.mk       |    0
 package/{ => kodi}/kodi-audioencoder-vorbis/Config.in      |    0
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk   |    0
 package/{ => kodi}/kodi-audioencoder-wav/Config.in         |    0
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk         |    0
 package/{ => kodi}/kodi-pvr-addons/Config.in               |    0
 package/{ => kodi}/kodi-pvr-addons/kodi-pvr-addons.mk      |    0
 package/kodi/{ => }/kodi/0001-Fixup-include-path.patch     |    0
 package/kodi/{ => }/kodi/Config.in                         |   12 ++++++------
 package/kodi/{ => }/kodi/S50kodi                           |    0
 package/kodi/{ => }/kodi/br-kodi                           |    0
 package/kodi/{ => }/kodi/kodi.mk                           |    6 +++---
 package/kodi/{ => }/kodi/kodi.service                      |    0
 20 files changed, 10 insertions(+), 10 deletions(-)
 rename package/{ => kodi}/kodi-addon-xvdr/0001-xbmc-rebrand.patch (100%)
 rename package/{ => kodi}/kodi-addon-xvdr/Config.in (100%)
 rename package/{ => kodi}/kodi-addon-xvdr/kodi-addon-xvdr.mk (100%)
 rename package/{ => kodi}/kodi-audioencoder-flac/Config.in (100%)
 rename package/{ => kodi}/kodi-audioencoder-flac/kodi-audioencoder-flac.mk (100%)
 rename package/{ => kodi}/kodi-audioencoder-lame/Config.in (100%)
 rename package/{ => kodi}/kodi-audioencoder-lame/kodi-audioencoder-lame.mk (100%)
 rename package/{ => kodi}/kodi-audioencoder-vorbis/Config.in (100%)
 rename package/{ => kodi}/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk (100%)
 rename package/{ => kodi}/kodi-audioencoder-wav/Config.in (100%)
 rename package/{ => kodi}/kodi-audioencoder-wav/kodi-audioencoder-wav.mk (100%)
 rename package/{ => kodi}/kodi-pvr-addons/Config.in (100%)
 rename package/{ => kodi}/kodi-pvr-addons/kodi-pvr-addons.mk (100%)
 rename package/kodi/{ => }/kodi/0001-Fixup-include-path.patch (100%)
 rename package/kodi/{ => }/kodi/Config.in (95%)
 rename package/kodi/{ => }/kodi/S50kodi (100%)
 rename package/kodi/{ => }/kodi/br-kodi (100%)
 rename package/kodi/{ => }/kodi/kodi.mk (98%)
 rename package/kodi/{ => }/kodi/kodi.service (100%)

diff --git a/package/Config.in b/package/Config.in
index 6dbc32d..15a19f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -16,7 +16,7 @@ menu "Audio and video applications"
 	source "package/gstreamer/Config.in"
 	source "package/gstreamer1/Config.in"
 	source "package/jack2/Config.in"
-	source "package/kodi/Config.in"
+	source "package/kodi/kodi/Config.in"
 	source "package/lame/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/madplay/Config.in"
diff --git a/package/kodi-addon-xvdr/0001-xbmc-rebrand.patch b/package/kodi/kodi-addon-xvdr/0001-xbmc-rebrand.patch
similarity index 100%
rename from package/kodi-addon-xvdr/0001-xbmc-rebrand.patch
rename to package/kodi/kodi-addon-xvdr/0001-xbmc-rebrand.patch
diff --git a/package/kodi-addon-xvdr/Config.in b/package/kodi/kodi-addon-xvdr/Config.in
similarity index 100%
rename from package/kodi-addon-xvdr/Config.in
rename to package/kodi/kodi-addon-xvdr/Config.in
diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk b/package/kodi/kodi-addon-xvdr/kodi-addon-xvdr.mk
similarity index 100%
rename from package/kodi-addon-xvdr/kodi-addon-xvdr.mk
rename to package/kodi/kodi-addon-xvdr/kodi-addon-xvdr.mk
diff --git a/package/kodi-audioencoder-flac/Config.in b/package/kodi/kodi-audioencoder-flac/Config.in
similarity index 100%
rename from package/kodi-audioencoder-flac/Config.in
rename to package/kodi/kodi-audioencoder-flac/Config.in
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
similarity index 100%
rename from package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
rename to package/kodi/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
diff --git a/package/kodi-audioencoder-lame/Config.in b/package/kodi/kodi-audioencoder-lame/Config.in
similarity index 100%
rename from package/kodi-audioencoder-lame/Config.in
rename to package/kodi/kodi-audioencoder-lame/Config.in
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
similarity index 100%
rename from package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
rename to package/kodi/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
diff --git a/package/kodi-audioencoder-vorbis/Config.in b/package/kodi/kodi-audioencoder-vorbis/Config.in
similarity index 100%
rename from package/kodi-audioencoder-vorbis/Config.in
rename to package/kodi/kodi-audioencoder-vorbis/Config.in
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
similarity index 100%
rename from package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
rename to package/kodi/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
diff --git a/package/kodi-audioencoder-wav/Config.in b/package/kodi/kodi-audioencoder-wav/Config.in
similarity index 100%
rename from package/kodi-audioencoder-wav/Config.in
rename to package/kodi/kodi-audioencoder-wav/Config.in
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
similarity index 100%
rename from package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
rename to package/kodi/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
diff --git a/package/kodi-pvr-addons/Config.in b/package/kodi/kodi-pvr-addons/Config.in
similarity index 100%
rename from package/kodi-pvr-addons/Config.in
rename to package/kodi/kodi-pvr-addons/Config.in
diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi/kodi-pvr-addons/kodi-pvr-addons.mk
similarity index 100%
rename from package/kodi-pvr-addons/kodi-pvr-addons.mk
rename to package/kodi/kodi-pvr-addons/kodi-pvr-addons.mk
diff --git a/package/kodi/0001-Fixup-include-path.patch b/package/kodi/kodi/0001-Fixup-include-path.patch
similarity index 100%
rename from package/kodi/0001-Fixup-include-path.patch
rename to package/kodi/kodi/0001-Fixup-include-path.patch
diff --git a/package/kodi/Config.in b/package/kodi/kodi/Config.in
similarity index 95%
rename from package/kodi/Config.in
rename to package/kodi/kodi/Config.in
index ea4b449..d9a068c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/kodi/Config.in
@@ -254,16 +254,16 @@ if BR2_PACKAGE_KODI_OPTICALDRIVE
 
 comment "Kodi audioencoder addons"
 
-source "package/kodi-audioencoder-flac/Config.in"
-source "package/kodi-audioencoder-lame/Config.in"
-source "package/kodi-audioencoder-vorbis/Config.in"
-source "package/kodi-audioencoder-wav/Config.in"
+source "package/kodi/kodi-audioencoder-flac/Config.in"
+source "package/kodi/kodi-audioencoder-lame/Config.in"
+source "package/kodi/kodi-audioencoder-vorbis/Config.in"
+source "package/kodi/kodi-audioencoder-wav/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
 comment "Kodi PVR addons"
 
-source "package/kodi-addon-xvdr/Config.in"
-source "package/kodi-pvr-addons/Config.in"
+source "package/kodi/kodi-addon-xvdr/Config.in"
+source "package/kodi/kodi-pvr-addons/Config.in"
 
 endif # BR2_PACKAGE_KODI
diff --git a/package/kodi/S50kodi b/package/kodi/kodi/S50kodi
similarity index 100%
rename from package/kodi/S50kodi
rename to package/kodi/kodi/S50kodi
diff --git a/package/kodi/br-kodi b/package/kodi/kodi/br-kodi
similarity index 100%
rename from package/kodi/br-kodi
rename to package/kodi/kodi/br-kodi
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi/kodi.mk
similarity index 98%
rename from package/kodi/kodi.mk
rename to package/kodi/kodi/kodi.mk
index 8712b12..26a5fe1 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi/kodi.mk
@@ -231,7 +231,7 @@ endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_CONFLUENCE_SKIN
 
 define KODI_INSTALL_BR_WRAPPER
-	$(INSTALL) -D -m 0755 package/kodi/br-kodi \
+	$(INSTALL) -D -m 0755 package/kodi/kodi/br-kodi \
 		$(TARGET_DIR)/usr/bin/br-kodi
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_INSTALL_BR_WRAPPER
@@ -250,12 +250,12 @@ endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_INSTALL_CONFIG_DIR
 
 define KODI_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/kodi/S50kodi \
+	$(INSTALL) -D -m 755 package/kodi/kodi/S50kodi \
 		$(TARGET_DIR)/etc/init.d/S50kodi
 endef
 
 define KODI_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/kodi/kodi.service \
+	$(INSTALL) -D -m 644 package/kodi/kodi/kodi.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/kodi.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
diff --git a/package/kodi/kodi.service b/package/kodi/kodi/kodi.service
similarity index 100%
rename from package/kodi/kodi.service
rename to package/kodi/kodi/kodi.service
-- 
1.7.10.4
