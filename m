From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Nov 2018 21:20:03 +0100
Subject: [Buildroot] [PATCH 1/1] weston: egl support needs egl glesv2
Message-ID: <20181120202003.21053-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/95db3f4ad4c7ae866b7db4431293c26faa5c1dfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/weston/weston.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 66f5d5d792..dba5f35bf4 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -50,9 +50,9 @@ else
 WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
 WESTON_CONF_OPTS += --enable-egl
-WESTON_DEPENDENCIES += libegl
+WESTON_DEPENDENCIES += libegl libgles
 else
 WESTON_CONF_OPTS += \
 	--disable-egl \
-- 
2.14.1
