From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Tue,  5 Nov 2019 12:42:15 +0300
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix pulseaudio support
Message-ID: <20191105094215.4580-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/freerdp/freerdp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 0f32ff4718..931fa49477 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -51,6 +51,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=ON
+FREERDP_CONF_OPTS += -DWITH_PULSE=ON
 FREERDP_DEPENDENCIES += pulseaudio
 else
 FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
-- 
2.21.0
