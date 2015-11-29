From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:25:36 +0100
Subject: [Buildroot] [git commit] yad: needs gtk3-x11
Message-ID: <20151129132539.9720C817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b17d8285096087bff8543d79e8a2b6ea0810192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doesn't build with broadway or wayland since it wants the X-variant of
gdk. Fixes:
http://autobuild.buildroot.net/results/91d/91dc6ab749f967ae046f856f3f592d5a548499c6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yad/yad.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
