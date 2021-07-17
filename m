From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:07:55 +0200
Subject: [Buildroot] [git commit] package/libnice: add gobject-introspection
 optional dependency
Message-ID: <20210717073435.09740803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=aade2fd293fc8a13bc5665fa70a4002ddac9aae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gobject-introspection is an optional dependency which is enabled by
default since version 0.1.8 and
https://github.com/libnice/libnice/commit/0388646bdba5f91bb6bb509f5a1c6e9e3f068555

Fixes:
 - http://autobuild.buildroot.org/results/1cba7aa233e19472a69ffc2d8f7324d363a22deb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
