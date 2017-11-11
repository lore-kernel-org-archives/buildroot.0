From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Nov 2017 17:41:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: fix build with threads
 disabled
Message-ID: <20171111164153.9587-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f16/f16a558c30199a92e93a31e0ba391b99a9bd689f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openjpeg/openjpeg.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index df85168b80..9a8fdab7a4 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -15,4 +15,10 @@ OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LCMS2),lcms2)
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+OPENJPEG_CONF_OPTS += -DOPJ_USE_THREAD=ON
+else
+OPENJPEG_CONF_OPTS += -DOPJ_USE_THREAD=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.11.0
