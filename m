From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Sep 2020 21:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: drop libcap dependency
Message-ID: <20200908195738.78038-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap has been drroped since version 0.11.0 and
https://github.com/swaywm/wlroots/commit/906c0766df2fec4bd32c316fd1b0d46fded5fc84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wlroots/wlroots.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 7923e94325..27ccc8d5f3 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -27,13 +27,6 @@ ifeq ($(BR2_PACKAGE_FFMPEG),y)
 WLROOTS_DEPENDENCIES += ffmpeg
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCAP),y)
-WLROOTS_CONF_OPTS += -Dlibcap=enabled
-WLROOTS_DEPENDENCIES += libcap
-else
-WLROOTS_CONF_OPTS += -Dlibcap=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WLROOTS_DEPENDENCIES += libpng
 endif
-- 
2.28.0
