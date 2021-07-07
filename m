From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  7 Jul 2021 22:41:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnice: add gobject-introspection
 optional dependency
Message-ID: <20210707204114.414040-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gobject-introspection is an optional dependency which is enabled by
default since version 0.1.8 and
https://github.com/libnice/libnice/commit/0388646bdba5f91bb6bb509f5a1c6e9e3f068555

Fixes:
 - http://autobuild.buildroot.org/results/1cba7aa233e19472a69ffc2d8f7324d363a22deb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnice/libnice.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 8cbf003529..8292250938 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -22,6 +22,13 @@ LIBNICE_CONF_OPTS += \
 LIBNICE_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBNICE_CONF_OPTS += --enable-introspection
+LIBNICE_DEPENDENCIES += gobject-introspection
+else
+LIBNICE_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 LIBNICE_CONF_OPTS += --with-gstreamer
 LIBNICE_DEPENDENCIES += gst1-plugins-base
-- 
2.30.2
