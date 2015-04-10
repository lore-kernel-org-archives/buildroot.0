From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 19:22:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/gd: Add dependency to libvpx
Message-ID: <1428686531-13084-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed to get reproducable builds and to reproduce this build error:
http://autobuild.buildroot.net/results/046/046dd505feb5e92bdee3d0993366be162da1223a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gd/gd.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 2991cd5..1b519de 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -51,6 +51,13 @@ else
 GD_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+GD_DEPENDENCIES += libvpx
+GD_CONF_OPTS += --with-vpx
+else
+GD_CONF_OPTS += --without-vpx
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 GD_DEPENDENCIES += tiff
 GD_CONF_OPTS += --with-tiff
-- 
1.7.10.4
