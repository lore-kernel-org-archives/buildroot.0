From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:40:33 +0200
Subject: [Buildroot] [git commit] package: remove consecutive empty lines
Message-ID: <20170406204038.431B58274D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eb5cf144f0cabc399ada1e4963fc66bbb5a8c62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Occurrences were searched using [1]:
check-package --include-only ConsecutiveEmptyLines $(find * -type f)
and manually removed.

[1] http://patchwork.ozlabs.org/patch/729666/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/amd-catalyst/amd-catalyst.mk                      | 2 --
 package/bcusdk/bcusdk.mk                                  | 1 -
 package/dhcp/Config.in                                    | 1 -
 package/docker-engine/docker-engine.mk                    | 1 -
 package/efl/Config.in                                     | 1 -
 package/ffmpeg/ffmpeg.mk                                  | 1 -
 package/gcc/gcc-final/gcc-final.mk                        | 1 -
 package/glibc/glibc.mk                                    | 1 -
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 1 -
 package/linux-zigbee/Config.in                            | 1 -
 package/ltp-testsuite/ltp-testsuite.mk                    | 1 -
 package/ne10/ne10.mk                                      | 1 -
 package/network-manager/network-manager.mk                | 1 -
 package/opencv3/Config.in                                 | 1 -
 package/openocd/openocd.mk                                | 1 -
 package/oracle-mysql/oracle-mysql.mk                      | 1 -
 package/qt/qt.mk                                          | 2 --
 package/qt5/qt5location/qt5location.mk                    | 1 -
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk          | 1 -
 package/rpcbind/rpcbind.mk                                | 1 -
 package/rrdtool/rrdtool.mk                                | 1 -
 package/rt-tests/Config.in                                | 1 -
 package/x11vnc/x11vnc.mk                                  | 1 -
 23 files changed, 25 deletions(-)

diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index 5636f81..d4f5d1c 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -16,7 +16,6 @@ AMD_CATALYST_SUFFIX = $(if $(BR2_x86_64),_64)
 AMD_CATALYST_ARCH_DIR = $(@D)/arch/x86$(AMD_CATALYST_SUFFIX)
 AMD_CATALYST_LIB_SUFFIX = $(if $(BR2_x86_64),64)
 
-
 define AMD_CATALYST_EXTRACT_CMDS
 	unzip -q $(DL_DIR)/$(AMD_CATALYST_SOURCE) -d $(@D)
 	$(SHELL) $(@D)/AMD-Catalyst-$(AMD_CATALYST_VERSION)-Linux-installer-$(AMD_CATALYST_VERBOSE_VER)-x86.x86_64.run --extract $(@D)
@@ -102,7 +101,6 @@ define AMD_CATALYST_INSTALL_XORG
 	$(INSTALL) -D -m 0644 package/amd-catalyst/20-fglrx.conf \
 		$(TARGET_DIR)/etc/X11/xorg.conf.d/20-fglrx.conf
 
-
 	# Common files: containing binary profiles about GPUs,
 	# required by the fglrx_drv xorg driver
 	$(INSTALL) -d $(TARGET_DIR)/etc/ati
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 12f41ea..f99dd70 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -24,7 +24,6 @@ BCUSDK_DEPENDENCIES = \
 	libpthsem \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
-
 define BCUSDK_REMOVE_EXAMPLES
 	$(RM) -rf $(TARGET_DIR)/usr/share/bcusdk
 endef
diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 4a30495..d09256a 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -26,7 +26,6 @@ config BR2_PACKAGE_DHCP_RELAY
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
-
 config BR2_PACKAGE_DHCP_CLIENT
 	bool "dhcp client"
 	help
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index db65e2d..5101702 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -34,7 +34,6 @@ DOCKER_ENGINE_GLDFLAGS_DOCKER += -extldflags '-static'
 endif
 endif
 
-
 DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
 DOCKER_ENGINE_BUILD_TARGETS = docker
 
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 960f275..b9c4334 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -135,7 +135,6 @@ config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 		BR2_PACKAGE_EFL_PULSEAUDIO && \
 		BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 
-
 comment "Warning: one of the recommended option for EFL is not enabled"
 	depends on !BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f1a1e0d..348bc82 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -473,7 +473,6 @@ else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
 endif
 
-
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index a15d837..e8d2e18 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -50,7 +50,6 @@ define  HOST_GCC_FINAL_CONFIGURE_CMDS
 	)
 endef
 
-
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index ccaa4c2..aa9b906 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -94,7 +94,6 @@ define GLIBC_CONFIGURE_CMDS
 	$(GLIBC_ADD_MISSING_STUB_H)
 endef
 
-
 #
 # We also override the install to target commands since we only want
 # to install the libraries, and nothing more.
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 69bb716..6bf159d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -24,7 +24,6 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 	--disable-esd \
 	--disable-esdtest
 
-
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
 	--disable-jack \
diff --git a/package/linux-zigbee/Config.in b/package/linux-zigbee/Config.in
index fc21faa..ff2b0f7 100644
--- a/package/linux-zigbee/Config.in
+++ b/package/linux-zigbee/Config.in
@@ -40,7 +40,6 @@ config BR2_PACKAGE_LINUX_ZIGBEE_TESTS
 	  Enable this option to install the Linux-ZigBee test programs
 	  to the target.
 
-
 config BR2_PACKAGE_LINUX_ZIGBEE_OLD_KERNEL_COMPAT
 	bool "compatibility with older kernels"
 	help
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index cd9a345..7f26bd2 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -68,5 +68,4 @@ endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
 endif
 
-
 $(eval $(autotools-package))
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 63a79e7..cb303bd 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -32,7 +32,6 @@ define NE10_INSTALL_STAGING_CMDS
 	$(NE10_INSTALL_STAGING_SHARED_LIB)
 endef
 
-
 define NE10_INSTALL_TARGET_CMDS
 	cp -dpf $(@D)/modules/libNE10*.so* $(TARGET_DIR)/usr/lib/
 endef
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 0815bdd..6adc9b1 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -22,7 +22,6 @@ NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_file__etc_redhat_release=no \
 	ac_cv_file__etc_SuSE_release=no
 
-
 NETWORK_MANAGER_CONF_OPTS = \
 	--disable-tests \
 	--disable-qt \
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 4c00bf1..ee589f9 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -130,7 +130,6 @@ comment "opengl support needs an OpenGL provider"
 
 endif # BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
 
-
 config BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
 	bool "imgcodecs"
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 8407bbc..911d311 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -113,6 +113,5 @@ endef
 OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
 HOST_OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
 
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 45a71fa..4307008 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -125,7 +125,6 @@ ORACLE_MYSQL_CONF_OPTS += \
 	--without-server
 endif
 
-
 define ORACLE_MYSQL_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
 endef
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 1fdb1bf..2580ee7 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -79,7 +79,6 @@ else
 QT_CONFIGURE_OPTS += -no-glib
 endif
 
-
 ### Pixel depths
 QT_PIXEL_DEPTHS = # empty
 ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_1),y)
@@ -547,7 +546,6 @@ define QT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
-
 # Build the list of libraries and plugins to install to the target
 
 QT_INSTALL_LIBS += QtCore
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 24b26b2..96263e8 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -62,5 +62,4 @@ define QT5LOCATION_INSTALL_TARGET_CMDS
 	$(QT5LOCATION_INSTALL_TARGET_QMLS)
 endef
 
-
 $(eval $(generic-package))
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 0f11b79..d289932 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -30,7 +30,6 @@ define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5BASE_WIDGETS),yy)
 define QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 28deb50..cf2e81d 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -36,5 +36,4 @@ define RPCBIND_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S30rpcbind
 endef
 
-
 $(eval $(autotools-package))
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 84c7bb7..028b7cb 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -25,7 +25,6 @@ RRDTOOL_CONF_OPTS = \
 	--disable-ruby \
 	--disable-tcl
 
-
 ifeq ($(BR2_NEEDS_GETTEXT),y)
 RRDTOOL_DEPENDENCIES += gettext
 endif
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index b39856d..23e911b 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_RT_TESTS
 
 	  http://rt.wiki.kernel.org
 
-
 comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_PACKAGE_RT_TESTS
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 561d7bf..9f4af12 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -61,5 +61,4 @@ else
 X11VNC_CONF_OPTS += --without-zlib
 endif
 
-
 $(eval $(autotools-package))
