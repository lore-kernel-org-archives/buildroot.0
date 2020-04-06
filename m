From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:27 +0200
Subject: [Buildroot] [git commit] package/atk: enable gobject-introspection
 support
Message-ID: <20200406202227.75A2581D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83f9a46e695037ef3e9ad06d9a69ff62fb4107de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt -Dintrospection=true.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/atk/atk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 7039666059..a16143d2c0 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -13,7 +13,13 @@ ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
 
-ATK_CONF_OPTS = -Dintrospection=false
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+ATK_CONF_OPTS += -Dintrospection=true
+ATK_DEPENDENCIES += gobject-introspection
+else
+ATK_CONF_OPTS += -Dintrospection=false
+endif
+
 ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
