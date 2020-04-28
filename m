From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Apr 2020 06:22:13 -0600
Subject: [Buildroot] [PATCH 2/2] package/weston: drop pkgconfig workaround
In-Reply-To: <20200428122213.63826-1-james.hilliard1@gmail.com>
References: <20200428122213.63826-1-james.hilliard1@gmail.com>
Message-ID: <20200428122213.63826-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer need this package specific pkconfig workaround as it is
now applied to all meson packages automatically.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/weston.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b22e685948..541c6ba024 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -14,7 +14,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
 
 WESTON_CONF_OPTS = \
-	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
 	-Dbackend-headless=false \
 	-Dcolor-management-colord=false \
 	-Dremoting=false
-- 
2.20.1
