From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 16:02:24 +0200
Subject: [Buildroot] [PATCH 2/2] php-imagick: propagate BR2_USE_MMU
	dependency
In-Reply-To: <1400335344-8531-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1400335344-8531-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1400335344-8531-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

php-imagick selects imagemagick, and imagemagick 'depends on
BR2_USE_MMU', but this dependency was not propagated to
php-imagick. This commit fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-imagick/Config.in | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.9.3
