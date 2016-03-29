From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 09:39:07 -0300
Subject: [Buildroot] [PATCH v2 2/6] weston: set default backend for fbdev
In-Reply-To: <1459255151-17084-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459255151-17084-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459255151-17084-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When it's enabled set the default weston backend to fbdev, otherwise the
drm backend is the default even though we are not building it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index beab7b4..a031f74 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -47,7 +47,9 @@ WESTON_CONF_OPTS += --disable-rdp-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPTS += --enable-fbdev-compositor
+WESTON_CONF_OPTS += \
+	--enable-fbdev-compositor \
+	WESTON_NATIVE_BACKEND=fbdev-backend.so
 else
 WESTON_CONF_OPTS += --disable-fbdev-compositor
 endif
-- 
2.7.3
