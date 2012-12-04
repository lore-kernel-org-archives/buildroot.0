From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 14:42:18 -0800
Subject: [Buildroot] [git commit] classpath: gstreamer support needs gtk as
	well
Message-ID: <20121204225019.BA1949995B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39cde08e1036eab9ca5ad5a4fb231c9bf4a30522
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/80550a210a72a64c182e00dc2cb3a15ec776b658

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/classpath/classpath.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 9142f69..2d12552 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -24,6 +24,10 @@ else
 CLASSPATH_CONF_OPT += --disable-gmp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
+CLASSPATH_CONF_OPT += --enable-gtk-peer
+CLASSPATH_DEPENDENCIES += libgtk2
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 CLASSPATH_CONF_OPT += --enable-gstreamer-peer
 CLASSPATH_DEPENDENCIES += gst-plugins-base
@@ -31,11 +35,8 @@ else
 CLASSPATH_CONF_OPT += --disable-gstreamer-peer
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
-CLASSPATH_CONF_OPT += --enable-gtk-peer
-CLASSPATH_DEPENDENCIES += libgtk2
 else
-CLASSPATH_CONF_OPT += --disable-gtk-peer
+CLASSPATH_CONF_OPT += --disable-gtk-peer --disable-gstreamer-peer
 endif
 
 ifeq ($(BR2_PACKAGE_QT),y)
