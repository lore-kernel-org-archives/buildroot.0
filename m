From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 23:11:37 +0100
Subject: [Buildroot] [git commit branch/next] weston: drop libunwind
 optional dependency
Message-ID: <20181120220855.A722183CD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fac4474cefc5ce0fd5efd620552dda2d217b497c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libunwind was dropped since 3.0.91, see:
https://github.com/wayland-project/weston/commit/bb707dc0fe331c9af112a0552b7aa6fde755dd83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index efe12bc01e..66f5d5d792 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -60,12 +60,6 @@ WESTON_CONF_OPTS += \
 	--disable-simple-egl-clients
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-WESTON_DEPENDENCIES += libunwind
-else
-WESTON_CONF_OPTS += --disable-libunwind
-endif
-
 ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
 WESTON_DEPENDENCIES += freerdp
 WESTON_CONF_OPTS += --enable-rdp-compositor
