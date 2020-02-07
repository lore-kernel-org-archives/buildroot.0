From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:16 +0100
Subject: [Buildroot] [PATCH 01/10] package/classpath: drop gstreamer 0.10.x
 support
In-Reply-To: <20200207145026.28384-1-peter@korsgaard.com>
References: <20200207145026.28384-1-peter@korsgaard.com>
Message-ID: <20200207145026.28384-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming removal of gstreamer 0.10, the logic for building
classpath with support for it must go as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.20.1
