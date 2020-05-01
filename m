From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 16:01:34 +0200
Subject: [Buildroot] [git commit] package/weston: drop pkgconfig workaround
Message-ID: <20200501134643.D0EB290D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=535db2a4509c1f567282ca7888003ae320d20314
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer need this package specific pkconfig workaround as it is
now applied to all meson packages automatically.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
