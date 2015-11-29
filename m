From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Nov 2015 08:39:50 -0300
Subject: [Buildroot] [PATCH] yad: needs gtk3-x11
Message-ID: <1448797190-18243-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doesn't build with broadway or wayland since it wants the X-variant of
gdk. Fixes:
http://autobuild.buildroot.net/results/91d/91dc6ab749f967ae046f856f3f592d5a548499c6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/yad/yad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index 9d7ab37..fc25267 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -13,7 +13,7 @@ YAD_DEPENDENCIES = host-intltool host-pkgconf
 
 YAD_CONF_OPTS = --enable-html=no
 
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 YAD_DEPENDENCIES += libgtk3
 YAD_CONF_OPTS += --with-gtk=gtk3
 else
-- 
2.4.10
