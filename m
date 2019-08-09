From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:06:48 +0200
Subject: [Buildroot] [git commit] package/metacity: fix build with NLS
Message-ID: <20190809200344.5C1B081417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c81486967666c1031a375efa22024c3a2f85d3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/c7a12e45c774905d4253db35c35c208d3f21ad49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
