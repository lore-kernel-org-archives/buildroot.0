From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:42:39 +0100
Subject: [Buildroot] [git commit] package/classpath: drop gstreamer 0.10.x
 support
Message-ID: <20200208214331.D3A898D665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87d907c2ffd842fe29b75b637ca568e3ffece108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the upcoming removal of gstreamer 0.10, the logic for building
classpath with support for it must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/classpath/classpath.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 6bba6948c5..7177bbfe06 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -12,6 +12,7 @@ CLASSPATH_CONF_OPTS = \
 	--disable-Werror \
 	--disable-gconf-peer \
 	--disable-gjdoc \
+	--disable-gstreamer-peer \
 	--enable-tools
 
 # classpath assumes qt runs on top of X11, but we
@@ -40,16 +41,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
 CLASSPATH_CONF_OPTS += --enable-gtk-peer
 CLASSPATH_DEPENDENCIES += libgtk2
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
-CLASSPATH_CONF_OPTS += --enable-gstreamer-peer
-CLASSPATH_DEPENDENCIES += gst-plugins-base
-else
-CLASSPATH_CONF_OPTS += --disable-gstreamer-peer
-endif
-
 else
-CLASSPATH_CONF_OPTS += --disable-gtk-peer --disable-gstreamer-peer
+CLASSPATH_CONF_OPTS += --disable-gtk-peer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT)$(BR2_TOOLCHAIN_HAS_THREADS),yyy)
