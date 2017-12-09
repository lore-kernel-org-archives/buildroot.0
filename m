From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Sat, 9 Dec 2017 16:49:07 +0100
Subject: [Buildroot] [PATCH] package/weston: Remove redundant dependency
Message-ID: <785b0693316e0980f8ec4be6490148c3e2920368.1512834692.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's already there, unconditionally, in the list of main dependencies.

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 package/weston/weston.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 638954f034..3d17a61577 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -86,7 +86,6 @@ ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
 WESTON_CONF_OPTS += \
 	--enable-drm-compositor \
 	WESTON_NATIVE_BACKEND=drm-backend.so
-WESTON_DEPENDENCIES += libdrm
 else
 WESTON_CONF_OPTS += --disable-drm-compositor
 endif
-- 
2.14.3
