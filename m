From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:05 -0300
Subject: [Buildroot] [PATCH v3 06/11] weston: drop --disable-xwayland-test
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's in the rpi backend block which makes no sense, and it depends on
xwayland being enabled which we currently don't support so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
