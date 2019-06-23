From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 17:34:49 +0200
Subject: [Buildroot] [git commit] package/imagemagick: add prompt for host
 variant
Message-ID: <20190623155616.8163882807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39719172100ae2b26330e9ebffd68f36354b943c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes, it is required to call imagemagick from a post-build script
or the likes, so we have to allow the user to enable the host variant
for imagemagick.

Update the linux package to select the host variant now.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                    |  1 +
 package/Config.in.host             |  1 +
 package/imagemagick/Config.in.host | 13 +++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 0bc9612551..9b8db5d4c0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -2,6 +2,7 @@ menu "Kernel"
 
 config BR2_LINUX_KERNEL
 	bool "Linux Kernel"
+	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""
 	help
 	  Enable this option if you want to build a Linux kernel for
 	  your embedded device
diff --git a/package/Config.in.host b/package/Config.in.host
index d1c6d0d81f..1501889b72 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -28,6 +28,7 @@ menu "Host utilities"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
+	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
new file mode 100644
index 0000000000..56d45df537
--- /dev/null
+++ b/package/imagemagick/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_IMAGEMAGICK
+	bool "host imagemagick"
+	help
+	  ImageMagick(R) is a software suite to create, edit, and
+	  compose bitmap images. It can read, convert and write images
+	  in a variety of formats (about 100) including DPX, EXR, GIF,
+	  JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript, SVG, and TIFF.
+	  Use ImageMagick to translate, flip, mirror, rotate, scale,
+	  shear and transform images, adjust image colors, apply various
+	  special effects, or draw text, lines, polygons, ellipses and
+	  B??zier curves.
+
+	  http://www.imagemagick.org/
