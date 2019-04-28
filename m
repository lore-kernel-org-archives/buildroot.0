From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Apr 2019 10:51:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/xapp_xload: fix build with NLS
Message-ID: <20190428085104.2930-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a69b957d0f3251031b0c67e951ba8fb8d1043ce0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xapp_xload/xapp_xload.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 605359bab6..4bb21ecf0b 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -9,8 +9,9 @@ XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
-XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
+XAPP_XLOAD_DEPENDENCIES = xlib_libXaw $(TARGET_NLS_DEPENDENCIES)
 XAPP_XLOAD_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
+XAPP_XLOAD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 # musl doesn't have rwhod.h, but xload can replace it with stubs
-- 
2.20.1
