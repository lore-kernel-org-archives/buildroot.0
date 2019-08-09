From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  9 Aug 2019 14:46:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/metacity: fix build with NLS
Message-ID: <20190809124604.29473-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c7a12e45c774905d4253db35c35c208d3f21ad49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/metacity/metacity.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index b93200ca5a..f5a6d4afd9 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -26,7 +26,10 @@ METACITY_DEPENDENCIES = libgtk2 \
 	xlib_libXcomposite \
 	xlib_libXfixes \
 	xlib_libXrender \
-	xlib_libXdamage
+	xlib_libXdamage \
+	$(TARGET_NLS_DEPENDENCIES)
+
+METACITY_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
 METACITY_DEPENDENCIES += xlib_libXcursor
-- 
2.20.1
