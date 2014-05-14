From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 May 2014 21:11:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/directfb: Disable dynload when
	BR2_PREFER_STATIC_LIB is enabled
Message-ID: <1400094716-27018-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes http://autobuild.buildroot.net/results/a74/a74b97053d7cad4fcce59f658a4b7b4340284b80/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/directfb/directfb.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 1d83a0b..3ae7f3e 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -26,6 +26,11 @@ DIRECTFB_CONF_OPT = \
 	--disable-video4linux \
 	--disable-video4linux2 \
 	--without-tools
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+DIRECTFB_CONF_OPT += --disable-dynload
+endif
+
 DIRECTFB_CONFIG_SCRIPTS = directfb-config
 
 DIRECTFB_DEPENDENCIES = freetype zlib
-- 
1.7.10.4
