From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jul 2020 11:29:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/mraa: add json-c support
Message-ID: <20200725092904.1163980-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mraa/mraa.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
index 9397f12cfd..89c539e793 100644
--- a/package/mraa/mraa.mk
+++ b/package/mraa/mraa.mk
@@ -30,8 +30,14 @@ MRAA_CONF_OPTS += \
 	-DBUILDSWIG=OFF \
 	-DUSBPLAT=OFF \
 	-DFTDI4222=OFF \
-	-DJSONPLAT=OFF \
 	-DENABLEEXAMPLES=OFF \
 	-DBUILDTESTS=OFF
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+MRAA_CONF_OPTS += -DJSONPLAT=ON
+MRAA_DEPENDENCIES += json-c
+else
+MRAA_CONF_OPTS += -DJSONPLAT=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.27.0
