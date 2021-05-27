From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 27 May 2021 16:37:52 +0300
Subject: [Buildroot] [PATCH next 1/1] package/wlroots: check for
 BR2_PACKAGE_SEATD
Message-ID: <20210527133752.413075-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the wlroots packaging by checking for the correct variable to
determine whether seatd is being built.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wlroots/wlroots.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 38ddba743d..0696d037df 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -46,7 +46,7 @@ else
 WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT),y)
+ifeq ($(BR2_PACKAGE_SEATD),y)
 WLROOTS_CONF_OPTS += -Dlibseat=enabled
 WLROOTS_DEPENDENCIES += seatd
 else
-- 
2.31.1
