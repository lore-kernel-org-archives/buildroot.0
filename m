From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:42 +0200
Subject: [Buildroot] [git commit] package/rygel: enable
 gobject-introspection support
Message-ID: <20200406202227.978888D335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c89c2234bcc0df315745eafc9e0808573a8ba485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rygel/rygel.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index c43030d69f..21c8ebee6a 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -33,6 +33,13 @@ ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
 RYGEL_DEPENDENCIES += gdk-pixbuf
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+RYGEL_CONF_OPTS += --enable-introspection
+RYGEL_DEPENDENCIES += gobject-introspection
+else
+RYGEL_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1),y)
 RYGEL_CONF_OPTS += \
 	--with-media-engine=gstreamer \
