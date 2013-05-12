From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:03:40 +0200
Subject: [Buildroot] [git commit] classpath: remove qt support
Message-ID: <20130512191127.9FD419A128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4624567df1c5e05963ecc0f2a36299a89068ca41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

classpath doesn't work with Qt in buildroot. It assumes qt will run on X11,
but we don't have qt-x11 support on buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/classpath/classpath.mk |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 2d12552..61a1034 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -8,6 +8,10 @@ CLASSPATH_CONF_OPT = \
 	--disable-gconf-peer \
 	--disable-tools
 
+# classpath assumes qt runs on top of X11, but we
+# don't support qt4 on X11
+CLASSPATH_CONF_OPT += --disable-qt-peer
+
 CLASSPATH_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
@@ -39,13 +43,6 @@ else
 CLASSPATH_CONF_OPT += --disable-gtk-peer --disable-gstreamer-peer
 endif
 
-ifeq ($(BR2_PACKAGE_QT),y)
-CLASSPATH_CONF_OPT += --enable-qt-peer
-CLASSPATH_DEPENDENCIES += qt
-else
-CLASSPATH_CONF_OPT += --disable-qt-peer
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
 CLASSPATH_CONF_OPT += --enable-xmlj
 CLASSPATH_DEPENDENCIES += libxml2 libxslt
