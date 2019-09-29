From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 19:37:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/zbar: bump version to 0.23
Message-ID: <20190929173700.22920-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License file was renamed, no changes at the license:
https://github.com/mchehab/zbar/commit/b3f2ec0c02769d4770fc53ea417488c850435a83

Configure option python2 was renamed to python:
https://github.com/mchehab/zbar/commit/78e9adca89ebd88c6e23c56696cf9475b5009c8e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zbar/zbar.hash | 4 ++--
 package/zbar/zbar.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 0f44d0f5c0..eae5b7ebf5 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 1ba9e94c7217a8bd3800f9f3abddf3ed393a62cdf141a709765aad2788744eb7 zbar-0.22.tar.bz2
-sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89 LICENSE
+sha256 e99fb8f3be85a76fe24784ad67fecb2da3a02b1e432696b05eefe212d448ad2e zbar-0.23.tar.bz2
+sha256 44260f9252c7fe38ba8dfb645330504f4a375e3a5e9dd7d5d6b9f04adb4952f1 LICENSE.md
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 63220774b9..0550f3e23f 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 0.22
+ZBAR_VERSION = 0.23
 ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
-ZBAR_LICENSE_FILES = LICENSE
+ZBAR_LICENSE_FILES = LICENSE.md
 ZBAR_INSTALL_STAGING = YES
 ZBAR_DEPENDENCIES = libv4l jpeg
 # add host-gettext for AM_ICONV macro
@@ -21,7 +21,7 @@ ZBAR_CONF_OPTS = \
 	--without-qt \
 	--without-qt5 \
 	--without-gtk \
-	--without-python2 \
+	--without-python \
 	--without-x \
 	--without-java
 
-- 
2.20.1
