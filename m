From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:39:08 -0300
Subject: [Buildroot] [PATCH v3 09/11] weston: handle webp dependency
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459262350-10974-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It doesn't have an enable/disable switch so it's just the dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e3a8f29..de734e0 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -11,7 +11,8 @@ WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
-	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput
+	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput \
+	$(if $(BR2_PACKAGE_WEBP),webp)
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-- 
2.7.3
