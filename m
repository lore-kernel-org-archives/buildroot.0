From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Apr 2014 00:35:46 +0200
Subject: [Buildroot] [git commit] weston: add optional libunwind support
Message-ID: <20140406223628.950E59C550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee7d28a539aca02da470ccbcc25b08c530716441
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6d1408f..b6b8556 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -26,8 +26,13 @@ WESTON_CONF_OPT = \
 	--disable-wayland-compositor \
 	--disable-headless-compositor \
 	--disable-weston-launch \
-	--disable-colord \
-	--disable-libunwind
+	--disable-colord
+
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+WESTON_DEPENDENCIES += libunwind
+else
+WESTON_CONF_OPT += --disable-libunwind
+endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
 WESTON_CONF_OPT += --enable-fbdev-compositor
