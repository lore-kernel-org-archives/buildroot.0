From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 23:25:34 +0200
Subject: [Buildroot] [git commit] php-imagick: propagate BR2_USE_MMU
	dependency
Message-ID: <20140517213137.2632D9C7C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e6fa1b4b02e85b47e16a7e2ea7cd05db6394ce8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

php-imagick selects imagemagick, and imagemagick 'depends on
BR2_USE_MMU', but this dependency was not propagated to
php-imagick. This commit fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-imagick/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/php-imagick/Config.in b/package/php-imagick/Config.in
index 1d55fcc..a5e32a5 100644
--- a/package/php-imagick/Config.in
+++ b/package/php-imagick/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PHP_IMAGICK
 	bool "php-imagick"
 	depends on BR2_PACKAGE_PHP
+	depends on BR2_USE_MMU # imagemagick
 	select BR2_PACKAGE_IMAGEMAGICK
 	help
 	  PHP wrapper to the ImageMagick library.
