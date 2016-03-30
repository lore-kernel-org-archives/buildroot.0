From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:00:40 +0200
Subject: [Buildroot] [git commit] weston: drop --disable-xwayland-test
Message-ID: <20160330150133.744627FEE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dee8b591f54d8fced6242de488e2f7118e1aba75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's in the rpi backend block which makes no sense, and it depends on
xwayland being enabled which we currently don't support so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e83abe0..363a2bf 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -82,7 +82,6 @@ ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
 WESTON_DEPENDENCIES += rpi-userland
 WESTON_CONF_OPTS += --enable-rpi-compositor \
 	--disable-resize-optimization \
-	--disable-xwayland-test \
 	WESTON_NATIVE_BACKEND=rpi-backend.so
 else
 WESTON_CONF_OPTS += --disable-rpi-compositor
