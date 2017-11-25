From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 25 Nov 2017 14:33:05 -0500
Subject: [Buildroot] [PATCH v2 1/1] freerdp: fix wayland client dependency
 chain failure
Message-ID: <20171125193305.9655-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the wayland client is selected, freerdp depends on libxkbcommon without
depending on it in the mk file.

Fixes:
http://autobuild.buildroot.net/results/dc3/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd
Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v1 -> v2:
  - Changed dependency logic (Yann)

 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 29c35164c3..7415b8a299 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -198,7 +198,7 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),y)
 FREERDP_DEPENDENCIES += wayland libxkbcommon
 FREERDP_CONF_OPTS += \
 	-DWITH_WAYLAND=ON \
-- 
2.14.3
