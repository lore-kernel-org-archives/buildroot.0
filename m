From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:35:06 +0100
Subject: [Buildroot] [git commit] package/*: do not override LICENSE,
 but append to it
Message-ID: <20191027092901.6F4E588F4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f295ad4cb0e16a823e1377eb97eaec39042f4ad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the infra takes care of removing extraneous spaces before
commas, we can safely append to LICENSE variables.

This removes the only case where we had to use immediate assignment
to append to a variable.

Mechanical change, with:

    $ sed -r -i -e 's/\<([^[:space:]]+_LICENSE) := \$\(\1\),/\1 += ,/' \
        $(git grep -l -E '\<([^[:space:]]+_LICENSE) := \$\(\1\),')

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dtc/dtc.mk                                      | 2 +-
 package/elfutils/elfutils.mk                            | 2 +-
 package/freeswitch/freeswitch.mk                        | 6 +++---
 package/gnutls/gnutls.mk                                | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 +++---
 package/iwd/iwd.mk                                      | 2 +-
 package/kmod/kmod.mk                                    | 2 +-
 package/kodi/kodi.mk                                    | 2 +-
 package/libidn2/libidn2.mk                              | 2 +-
 package/libuci/libuci.mk                                | 2 +-
 package/qt5/qt5base/qt5base.mk                          | 4 ++--
 package/qt5/qt5connectivity/qt5connectivity.mk          | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk                    | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk              | 2 +-
 package/qt5/qt5scxml/qt5scxml.mk                        | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk    | 8 ++++----
 package/qt5/qt5webchannel/qt5webchannel.mk              | 2 +-
 package/qt5/qt5websockets/qt5websockets.mk              | 2 +-
 package/qt5/qt5webview/qt5webview.mk                    | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk            | 2 +-
 package/sg3_utils/sg3_utils.mk                          | 2 +-
 package/usbredir/usbredir.mk                            | 2 +-
 22 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 0406ff7ca9..7fde0dc968 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -36,7 +36,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
 
-DTC_LICENSE := $(DTC_LICENSE), GPL-2.0+ (programs)
+DTC_LICENSE += , GPL-2.0+ (programs)
 DTC_INSTALL_GOAL = install
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 29cfdc2159..c3df7303b7 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -72,7 +72,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
 ELFUTILS_CONF_OPTS += --enable-progs
-ELFUTILS_LICENSE := $(ELFUTILS_LICENSE), GPL-3.0+ (programs)
+ELFUTILS_LICENSE += , GPL-3.0+ (programs)
 ELFUTILS_LICENSE_FILES += COPYING
 else
 ELFUTILS_CONF_OPTS += --disable-progs
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 4736ef4531..41f298a313 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -164,7 +164,7 @@ FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 # mod_isac supports a limited set of archs
 # src/mod/codecs/mod_isac/typedefs.h
 ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
-FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-3-Clause (mod_isac)
+FREESWITCH_LICENSE += , BSD-3-Clause (mod_isac)
 FREESWITCH_LICENSE_FILES += src/mod/codecs/mod_isac/LICENSE
 FREESWITCH_ENABLED_MODULES += codecs/mod_isac
 endif
@@ -221,7 +221,7 @@ FREESWITCH_ENABLED_MODULES += applications/mod_memcache
 endif
 
 ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
-FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-2-Clause (libopenh264)
+FREESWITCH_LICENSE += , BSD-2-Clause (libopenh264)
 FREESWITCH_LICENSE_FILES += docs/OPENH264_BINARY_LICENSE.txt
 FREESWITCH_DEPENDENCIES += libopenh264
 FREESWITCH_ENABLED_MODULES += codecs/mod_openh264
@@ -303,7 +303,7 @@ FREESWITCH_DEPENDENCIES += xz
 endif
 
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_PACKAGE_FFMPEG),yy)
-FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-3-Clause (libvpx, libyuv)
+FREESWITCH_LICENSE += , BSD-3-Clause (libvpx, libyuv)
 FREESWITCH_LICENSE_FILES += libs/libvpx/LICENSE libs/libyuv/LICENSE
 FREESWITCH_CONF_OPTS += --enable-libvpx --enable-libyuv
 FREESWITCH_DEPENDENCIES += host-yasm ffmpeg
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 13029bbe2f..efdcd21d9d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -12,7 +12,7 @@ GNUTLS_LICENSE = LGPL-2.1+ (core library)
 GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
 
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
-GNUTLS_LICENSE := $(GNUTLS_LICENSE), GPL-3.0+ (gnutls-openssl library)
+GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += doc/COPYING
 endif
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f4a7a65871..59eb332e57 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -724,18 +724,18 @@ endif
 
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
-GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), GPL-2.0+
+GST1_PLUGINS_BAD_LICENSE += , GPL-2.0+
 GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
 endif
 
 # Add BSD license if BSD licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE),y)
-GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), BSD-2-Clause
+GST1_PLUGINS_BAD_LICENSE += , BSD-2-Clause
 endif
 
 # Add Unknown license if Unknown licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE),y)
-GST1_PLUGINS_BAD_LICENSE := $(GST1_PLUGINS_BAD_LICENSE), UNKNOWN
+GST1_PLUGINS_BAD_LICENSE += , UNKNOWN
 endif
 
 # Use the following command to extract license info for plugins.
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 40ee06ba6f..fc8b83d1bb 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -32,7 +32,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 # iwd client depends on readline (GPL-3.0+)
-IWD_LICENSE := $(IWD_LICENSE), GPL-3.0+ (client)
+IWD_LICENSE += , GPL-3.0+ (client)
 IWD_CONF_OPTS += --enable-client
 IWD_DEPENDENCIES += readline
 else
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 01bd85e06f..e21f40a845 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -52,7 +52,7 @@ endif
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
-KMOD_LICENSE := $(KMOD_LICENSE), GPL-2.0+ (tools)
+KMOD_LICENSE += , GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
 # /sbin is really /usr/sbin with merged /usr, so adjust relative symlink
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 6e482e615c..028bf551bc 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -195,7 +195,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_KODI_NONFREE),y)
 KODI_CONF_OPTS += -DENABLE_NONFREE=ON
-KODI_LICENSE := $(KODI_LICENSE), unrar
+KODI_LICENSE += , unrar
 KODI_LICENSE_FILES += lib/UnrarXLib/license.txt
 else
 KODI_CONF_OPTS += -DENABLE_NONFREE=OFF
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 10f179ebcc..bd6c559d04 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -24,7 +24,7 @@ define LIBIDN2_REMOVE_BINARY
 endef
 LIBIDN2_POST_INSTALL_TARGET_HOOKS += LIBIDN2_REMOVE_BINARY
 else
-LIBIDN2_LICENSE := $(LIBIDN2_LICENSE), GPL-3.0+ (program)
+LIBIDN2_LICENSE += , GPL-3.0+ (program)
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 642238c2e8..55afd53c10 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -15,7 +15,7 @@ LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
 	-DLUAPATH=/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
-LIBUCI_LICENSE := $(LIBUCI_LICENSE), GPL-2.0 (lua bindings)
+LIBUCI_LICENSE += , GPL-2.0 (lua bindings)
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e4aa76908a..15c9650391 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -101,7 +101,7 @@ QT5BASE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs
 QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3-Clause (examples)
+QT5BASE_LICENSE += , BSD-3-Clause (examples)
 QT5BASE_LICENSE_FILES += header.BSD
 endif
 
@@ -153,7 +153,7 @@ QT5BASE_DEPENDENCIES += harfbuzz
 else
 # qt harfbuzz otherwise (using QAtomic instead)
 QT5BASE_CONFIGURE_OPTS += -qt-harfbuzz
-QT5BASE_LICENSE := $(QT5BASE_LICENSE), MIT (harfbuzz)
+QT5BASE_LICENSE += , MIT (harfbuzz)
 QT5BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
 endif
 else
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 24dbc2cba0..8e4e4669b9 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -18,7 +18,7 @@ QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5CONNECTIVITY_LICENSE := $(QT5CONNECTIVITY_LICENSE), BSD-3-Clause (examples)
+QT5CONNECTIVITY_LICENSE += , BSD-3-Clause (examples)
 endif
 
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5DECLARATIVE),qt5declarative)
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 2a4cf72ec7..ebd99e4cb7 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -15,7 +15,7 @@ QT5ENGINIO_INSTALL_STAGING = YES
 QT5ENGINIO_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5ENGINIO_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5ENGINIO_LICENSE := $(QT5ENGINIO_LICENSE), BSD-3-Clause (examples)
+QT5ENGINIO_LICENSE += , BSD-3-Clause (examples)
 endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index b8a1c4ff75..611b41a8c7 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -74,7 +74,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5MULTIMEDIA_LICENSE := $(QT5MULTIMEDIA_LICENSE), LGPL-2.1+ (examples/multimedia/spectrum/3rdparty/fftreal)
+QT5MULTIMEDIA_LICENSE += , LGPL-2.1+ (examples/multimedia/spectrum/3rdparty/fftreal)
 QT5MULTIMEDIA_LICENSE_FILES += examples/multimedia/spectrum/3rdparty/fftreal/license.txt
 define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index b54ef0e43a..c0776314d5 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -13,7 +13,7 @@ QT5SCXML_INSTALL_STAGING = YES
 QT5SCXML_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SCXML_LICENSE_FILES = LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5SCXML_LICENSE := $(QT5SCXML_LICENSE), BSD-3-Clause (examples)
+QT5SCXML_LICENSE += , BSD-3-Clause (examples)
 endif
 
 define QT5SCXML_CONFIGURE_CMDS
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 814b454010..59ee30c2d2 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -25,7 +25,7 @@ ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (openwnn)
+QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (openwnn)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
 else
@@ -35,7 +35,7 @@ endif
 
 ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
-QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (pinyin)
+QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (pinyin)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
 else
@@ -45,7 +45,7 @@ endif
 
 ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
-QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (tcime), BSD-3-Clause (tcime)
+QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (tcime), BSD-3-Clause (tcime)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
 else
@@ -57,7 +57,7 @@ endif
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING),y)
 QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
-QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
+QT5VIRTUALKEYBOARD_LICENSE += , MIT (lipi-toolkit)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
 else
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index d136041980..22523036e7 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -18,7 +18,7 @@ QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5WEBCHANNEL_LICENSE := $(QT5WEBCHANNEL_LICENSE), BSD-3-Clause (examples)
+QT5WEBCHANNEL_LICENSE += , BSD-3-Clause (examples)
 endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index d026a44ff1..6e734a3bf3 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -18,7 +18,7 @@ QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5WEBSOCKETS_LICENSE := $(QT5WEBSOCKETS_LICENSE), BSD-3-Clause (examples)
+QT5WEBSOCKETS_LICENSE += , BSD-3-Clause (examples)
 endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index d9b913d68e..0a80dba612 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -13,7 +13,7 @@ QT5WEBVIEW_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0, GFDL-1.3 (docs)
 QT5WEBVIEW_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5WEBVIEW_LICENSE := $(QT5WEBVIEW_LICENSE), BSD-3-Clause (examples)
+QT5WEBVIEW_LICENSE += , BSD-3-Clause (examples)
 endif
 
 define QT5WEBVIEW_CONFIGURE_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 8be708844b..6ed247fd59 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -18,7 +18,7 @@ QT5XMLPATTERNS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3-Clause (examples)
+QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 79521fd06e..7070d6f83d 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -10,7 +10,7 @@ SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3-Clause (library)
 # Some utils progs are GPL-2.0+ licensed while others are BSD-3-Clause
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
-SG3_UTILS_LICENSE := $(SG3_UTILS_LICENSE), GPL-2.0+ (programs), BSD-3-Clause (programs)
+SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-3-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 229a9a5618..8848670ea9 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -14,7 +14,7 @@ USBREDIR_DEPENDENCIES = host-pkgconf libusb
 
 ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
 
-USBREDIR_LICENSE := $(USBREDIR_LICENSE), GPL-2.0+ (program)
+USBREDIR_LICENSE += , GPL-2.0+ (program)
 USBREDIR_LICENSE_FILES += COPYING
 
 else # BR2_PACKAGE_USBREDIR_SERVER != y
