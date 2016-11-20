From: pierre floury <devpfl@gmail.com>
Date: Sun, 20 Nov 2016 19:59:47 +0100
Subject: [Buildroot] [v3,2/2] package/efl: add Evas GL DRM Engine support
In-Reply-To: <1479668387-6549-1-git-send-email-devpfl@gmail.com>
References: <1479668387-6549-1-git-send-email-devpfl@gmail.com>
Message-ID: <1479668387-6549-3-git-send-email-devpfl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

This support is required for Enlightenment wayland support [1].

As stated in configure, Evas GL DRM Engine needs OpenGL ES with EGL and
wayland (wayland-client >= 1.8.0)

[1] https://www.enlightenment.org/about-wayland

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Pierre Floury <devpfl@gmail.com>

---
v2: rename the option to BR2_PAKCAGE_EFL_GLES_DRM (ThomasP)
    fix the help text (ThomasP)
---
v3: rebase v2 on top of master
    Signed-off-by: Pierre Floury <devpfl@gmail.com>
---
 package/efl/efl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d6b2bf5..fdeea47 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -199,6 +199,12 @@ else
 EFL_CONF_OPTS += --disable-drm
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_OPENGLES)$(BR2_PACKAGE_EFL_DRM),yy)
+EFL_CONF_OPTS += --enable-gl-drm
+else
+EFL_CONF_OPTS += --disable-gl-drm
+endif
+
 EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 
 # Loaders that need external dependencies needs to be --enable-XXX=yes
-- 
2.1.4
