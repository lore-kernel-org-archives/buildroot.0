From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Oct 2014 16:37:43 -0300
Subject: [Buildroot] [PATCH] freerdp: alsa support needs mixer as well
Message-ID: <1414179463-28560-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/5ed/5edaa6654b90299ead5255d1cbdf79eb8b40fc6f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 84c2d81..cb745ec 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -26,7 +26,7 @@ else
 FREERDP_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER),y)
 FREERDP_CONF_OPTS += -DWITH_ALSA=ON
 FREERDP_DEPENDENCIES += alsa-lib
 else
-- 
2.0.4
