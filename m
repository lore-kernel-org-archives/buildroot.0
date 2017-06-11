From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Jun 2017 15:13:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/lcdproc: override freetype-config
	path
Message-ID: <20170611131317.16345-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

freetype-config from the host system may be used when installed.
Make sure that the one from HOST_DIR is used.

checking if freetype support has been enabled... yes
checking for freetype-config... /usr/bin/freetype-config
checking for FreeType -- version >= 7.0.1... cross compiling; assuming OK... yes

Fixes:
http://autobuild.buildroot.net/results/c7c/c7c52cd56b985fd73434d5997e9a6ab3f7d7e71e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/lcdproc/lcdproc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index c6476eb..5196368 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -18,6 +18,8 @@ endif
 
 LCDPROC_DEPENDENCIES = freetype ncurses zlib
 
+LCDPROC_CONF_ENV += ac_cv_path_FT2_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LCDPROC_DEPENDENCIES += libpng
 LCDPROC_CONF_OPTS += --enable-libpng
-- 
2.9.4
