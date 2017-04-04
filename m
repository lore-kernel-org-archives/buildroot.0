From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:14 -0300
Subject: [Buildroot] [PATCH 06/11] package: remove trailing backslash
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Occurrences were searched using [1]:
check-package --include-only TrailingBackslash $(find * -type f)
and manually removed.

[1] http://patchwork.ozlabs.org/patch/729669/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/cegui06/cegui06.mk             |  4 ++--
 package/celt051/celt051.mk             |  2 +-
 package/flannel/flannel.mk             |  2 +-
 package/hostapd/hostapd.mk             |  2 +-
 package/jimtcl/jimtcl.mk               |  2 +-
 package/libnice/libnice.mk             |  2 +-
 package/nvidia-driver/nvidia-driver.mk | 10 +++++-----
 package/parted/parted.mk               |  2 +-
 package/redis/redis.mk                 |  2 +-
 package/spice/spice.mk                 |  4 ++--
 package/tiff/tiff.mk                   |  2 +-
 package/uclibc/uclibc.mk               |  2 +-
 package/vlc/vlc.mk                     |  2 +-
 13 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
index 43d3b09dd..8b2c886c7 100644
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -16,7 +16,7 @@ CEGUI06_INSTALL_STAGING = YES
 CEGUI06_DEPENDENCIES =              \
 	expat                       \
 	freetype                    \
-	pcre                        \
+	pcre
 
 CEGUI06_CONF_OPTS =                 \
 	--enable-expat              \
@@ -31,6 +31,6 @@ CEGUI06_CONF_OPTS =                 \
 	--disable-samples           \
 	--disable-lua-module        \
 	--disable-toluacegui        \
-	--disable-external-toluapp  \
+	--disable-external-toluapp
 
 $(eval $(autotools-package))
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
index 6074c4939..a5b6f47a0 100644
--- a/package/celt051/celt051.mk
+++ b/package/celt051/celt051.mk
@@ -25,6 +25,6 @@ CELT051_CONF_OPTS =                       \
 	--disable-static-modes            \
 	--disable-assertions              \
 	--disable-oggtest                 \
-	--with-ogg=$(STAGING_DIR)/usr     \
+	--with-ogg=$(STAGING_DIR)/usr
 
 $(eval $(autotools-package))
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 18c0af160..8393c5992 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -20,7 +20,7 @@ FLANNEL_MAKE_ENV = \
 	CGO_ENABLED=1
 
 FLANNEL_GLDFLAGS = \
-	-X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION) \
+	-X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 FLANNEL_GLDFLAGS += -extldflags '-static'
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index cf651f8d1..dc28d1323 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -51,7 +51,7 @@ endif
 ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
 HOSTAPD_CONFIG_ENABLE += \
 	CONFIG_EAP \
-	CONFIG_RADIUS_SERVER \
+	CONFIG_RADIUS_SERVER
 
 # Enable both TLS v1.1 (CONFIG_TLSV11) and v1.2 (CONFIG_TLSV12)
 HOSTAPD_CONFIG_ENABLE += CONFIG_TLSV1
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 78517c4f4..cdbf8ae47 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -17,7 +17,7 @@ JIMTCL_HEADERS_TO_INSTALL = \
 	jim-signal.h \
 	jim-subcmd.h \
 	jim-win32compat.h \
-	jim-config.h \
+	jim-config.h
 
 ifeq ($(BR2_PACKAGE_TCL),)
 define JIMTCL_LINK_TCLSH
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 5ec2b6151..6afcb7635 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -14,6 +14,6 @@ LIBNICE_INSTALL_STAGING = YES
 LIBNICE_AUTORECONF = YES
 LIBNICE_CONF_OPTS = \
 	--without-gstreamer \
-	--without-gstreamer-0.10 \
+	--without-gstreamer-0.10
 
 $(eval $(autotools-package))
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index cb9b7faec..0d0311001 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -43,18 +43,18 @@ NVIDIA_DRIVER_PROVIDES = libgl libegl libgles
 NVIDIA_DRIVER_LIBS_GL = \
 	libGLX.so.0 \
 	libGL.so.$(NVIDIA_DRIVER_VERSION) \
-	libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_EGL = \
 	libEGL.so.1 \
 	libGLdispatch.so.0 \
-	libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_GLES = \
 	libGLESv1_CM.so.1 \
 	libGLESv2.so.2 \
 	libGLESv1_CM_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
-	libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_MISC = \
 	libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
@@ -63,13 +63,13 @@ NVIDIA_DRIVER_LIBS_MISC = \
 	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
 	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
 	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS = \
 	$(NVIDIA_DRIVER_LIBS_GL) \
 	$(NVIDIA_DRIVER_LIBS_EGL) \
 	$(NVIDIA_DRIVER_LIBS_GLES) \
-	$(NVIDIA_DRIVER_LIBS_MISC) \
+	$(NVIDIA_DRIVER_LIBS_MISC)
 
 # Install the gl.pc file
 define NVIDIA_DRIVER_INSTALL_GL_DEV
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index f88143bc2..fb4987fd5 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -36,7 +36,7 @@ endif
 HOST_PARTED_DEPENDENCIES = host-pkgconf host-util-linux
 HOST_PARTED_CONF_OPTS += \
 	--without-readline \
-	--disable-device-mapper \
+	--disable-device-mapper
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 679862093..3f4956cf3 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -23,7 +23,7 @@ endif
 # instead.
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
 	LDFLAGS="$(TARGET_LDFLAGS) $(REDIS_LIBATOMIC)" \
-	PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
+	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
 
 define REDIS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 047453848..086f5d6bb 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -18,7 +18,7 @@ SPICE_DEPENDENCIES =        \
 	openssl             \
 	pixman              \
 	python-pyparsing    \
-	spice-protocol      \
+	spice-protocol
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
@@ -26,7 +26,7 @@ SPICE_CONF_OPTS =                 \
 	--disable-opengl          \
 	--disable-smartcard       \
 	--disable-automated-tests \
-	--without-sasl            \
+	--without-sasl
 
 SPICE_DEPENDENCIES += host-pkgconf
 
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index ffb1a425c..e5b01db88 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -11,7 +11,7 @@ TIFF_LICENSE_FILES = COPYRIGHT
 TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPTS = \
 	--disable-cxx \
-	--without-x \
+	--without-x
 
 TIFF_DEPENDENCIES = host-pkgconf
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b1e611293..44c23a788 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -35,7 +35,7 @@ UCLIBC_KCONFIG_OPTS = \
 	$(UCLIBC_MAKE_FLAGS) \
 	PREFIX=$(STAGING_DIR) \
 	DEVEL_PREFIX=/usr/ \
-	RUNTIME_PREFIX=$(STAGING_DIR)/ \
+	RUNTIME_PREFIX=$(STAGING_DIR)/
 
 UCLIBC_TARGET_ARCH = $(call qstrip,$(BR2_UCLIBC_TARGET_ARCH))
 
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6fc77348f..36b5fd3ea 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -61,7 +61,7 @@ VLC_CONF_OPTS += \
 	--disable-mfx \
 	--disable-vdpau \
 	--disable-addonmanagermodules \
-	--enable-run-as-root \
+	--enable-run-as-root
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.11.0
