From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Dec 2013 02:16:52 +0100
Subject: [Buildroot] [PATCH] libdrm: Disable vmwgfx if specified by config
Message-ID: <1387243012-5162-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
---
 package/libdrm/libdrm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index da3a87c..dd08af1 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -44,7 +44,7 @@ ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
 LIBDRM_CONF_OPT += --enable-vmwgfx
 LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
-LIBDRM_CONF_OPT += --enable-vmwgfx
+LIBDRM_CONF_OPT += --disable-vmwgfx
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
-- 
1.8.5.1
