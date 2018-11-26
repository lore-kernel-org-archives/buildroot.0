From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:22:17 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] weston: egl support needs
 egl glesv2
Message-ID: <20181126161930.2E5BF88717@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cb7ca1a53729bcec9c35dbf65c9714e45600179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes:
 - http://autobuild.buildroot.org/results/95db3f4ad4c7ae866b7db4431293c26faa5c1dfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit be3fa4bed7b7298c67065090de1ef54e423f29ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index efe12bc01e..57d6df4b2d 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -50,9 +50,9 @@ else
 WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
 WESTON_CONF_OPTS += --enable-egl
-WESTON_DEPENDENCIES += libegl
+WESTON_DEPENDENCIES += libegl libgles
 else
 WESTON_CONF_OPTS += \
 	--disable-egl \
