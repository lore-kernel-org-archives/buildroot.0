From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 19 Feb 2019 14:15:29 +0100
Subject: [Buildroot] [PATCH 2/3] package/imagemagick: add prompt for host
 variant
In-Reply-To: <20190219131530.16364-1-yann.morin@orange.com>
References: <20190219131530.16364-1-yann.morin@orange.com>
Message-ID: <3833_1550582141_5C6C017D_3833_428_1_8b3762a4-694a-45cd-8cac-301fd3ba7526@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

Sometimes, it is required to call imagemagick from a posr-build script
or the likes, so we have to allow the user to enable the host variant
for imagemagick.

Update the linux package to select the host variant now.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
---
 linux/Config.in                    |  1 +
 package/Config.in.host             |  1 +
 package/imagemagick/Config.in.host | 13 +++++++++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/imagemagick/Config.in.host

diff --git a/linux/Config.in b/linux/Config.in
index 323ba38d72..8466332dfe 100644
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
index b4c501a33b..48f4f7e61d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -27,6 +27,7 @@ menu "Host utilities"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
+	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
new file mode 100644
index 0000000000..b6d2a379f8
--- /dev/null
+++ b/package/imagemagick/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_IMAGEMAGICK
+	bool "host-imagemagick"
+	help
+	  ImageMagick(R) is a software suite to create, edit, and
+	  compose bitmap images. It can read, convert and write images
+	  in a variety of formats (about 100) including DPX, EXR, GIF,
+	  JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript, SVG, and TIFF.
+	  Use ImageMagick to translate, flip, mirror, rotate, scale,
+	  shear and transform images, adjust image colors, apply various
+	  special effects, or draw text, lines, polygons, ellipses and
+	  B?zier curves.
+
+	  http://www.imagemagick.org/
-- 
2.17.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
