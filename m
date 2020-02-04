From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 16:02:19 +0100
Subject: [Buildroot] [git commit] package/weston: add pipewire support
Message-ID: <20200204145321.5B1EA8B52D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0c5e294b939167ceda718a9729d6ddb64c3a4b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index ada3f565cb..b22e685948 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -17,8 +17,7 @@ WESTON_CONF_OPTS = \
 	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
 	-Dbackend-headless=false \
 	-Dcolor-management-colord=false \
-	-Dremoting=false \
-	-Dpipewire=false
+	-Dremoting=false
 
 # Uses VIDIOC_EXPBUF, only available from 3.8+
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
@@ -127,6 +126,13 @@ else
 WESTON_CONF_OPTS += -Dtest-junit-xml=false
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
+WESTON_CONF_OPTS += -Dpipewire=true
+WESTON_DEPENDENCIES += pipewire
+else
+WESTON_CONF_OPTS += -Dpipewire=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
 WESTON_CONF_OPTS += -Ddemo-clients=true
 WESTON_DEPENDENCIES += pango
