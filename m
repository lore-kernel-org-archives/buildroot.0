From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:41:36 +0200
Subject: [Buildroot] [git commit] xbmc: Add option for Goom screensaver
Message-ID: <20140803084505.9F76C9D11D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb34bf1230b80713bdaa9c920e5c3bb88896d2f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/Config.in |    9 +++++++++
 package/xbmc/xbmc.mk   |    6 ++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 04bc86f..6a00531 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -128,6 +128,15 @@ config BR2_PACKAGE_XBMC_LIBBLURAY
 comment "libbluray support needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_XBMC_GOOM
+	bool "goom screensaver"
+	depends on BR2_PACKAGE_XBMC_GL
+	help
+	  Enable goom screensaver
+
+comment "goom needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XBMC_GL
+
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_PREFER_STATIC_LIB # libcec
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index c868b59..920d731 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -109,6 +109,12 @@ XBMC_CONF_OPT += --disable-gles
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_XBMC_GOOM),y)
+XBMC_CONF_OPT += --enable-goom
+else
+XBMC_CONF_OPT += --disable-goom
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
