From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 16:58:06 +0200
Subject: [Buildroot] [git commit] weston: set default backend for fbdev
Message-ID: <20160330145808.27A7A818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da34e3e88b989b8fdd7079a29b799ba6d7b2496b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When it's enabled set the default weston backend to fbdev, otherwise the
drm backend is the default even though we are not building it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e7ad97e..5af23df 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -49,7 +49,9 @@ WESTON_CONF_OPTS += --disable-rdp-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPTS += --enable-fbdev-compositor
+WESTON_CONF_OPTS += \
+	--enable-fbdev-compositor \
+	WESTON_NATIVE_BACKEND=fbdev-backend.so
 else
 WESTON_CONF_OPTS += --disable-fbdev-compositor
 endif
