From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 09:39:09 -0300
Subject: [Buildroot] [PATCH v2 4/6] weston: handle optional libva support
In-Reply-To: <1459255151-17084-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459255151-17084-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459255151-17084-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no enable/disable option so it's just the dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index a002407..7a4a2e0 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -11,7 +11,8 @@ WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput
+	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput \
+	$(if $(BR2_PACKAGE_LIBVA),libva)
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-- 
2.7.3
