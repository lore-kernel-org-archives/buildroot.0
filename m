From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Dec 2017 20:54:31 +0100
Subject: [Buildroot] [git commit] package/weston: Remove redundant dependency
Message-ID: <20171210195454.0E2E28284F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28ffb6f6f8b1a5b28b025c100d09675f31ff027e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's already there, unconditionally, in the list of main dependencies.

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 638954f..3d17a61 100644
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
