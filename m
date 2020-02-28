From: Nathan Ford <nford@westpond.com>
Date: Fri, 28 Feb 2020 12:05:40 -0500
Subject: [Buildroot] [PATCH v3 2/2] package/qt5/qt5webengine: fix build
 dependencies for autodetected packages
In-Reply-To: <1582909540-10901-1-git-send-email-nford@westpond.com>
References: <1582909540-10901-1-git-send-email-nford@westpond.com>
Message-ID: <1582909540-10901-2-git-send-email-nford@westpond.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Ford <nford@westpond.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webengine/qt5webengine.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 3824738..e5f8421 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -60,6 +60,34 @@ QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_JSONCPP),y)
+QT5WEBENGINE_DEPENDENCIES += jsoncpp
+endif
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+QT5WEBENGINE_DEPENDENCIES += lcms2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+QT5WEBENGINE_DEPENDENCIES += libevent
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+QT5WEBENGINE_DEPENDENCIES += libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+QT5WEBENGINE_DEPENDENCIES += libxslt
+endif
+
+ifeq ($(BR2_PACKAGE_PROTOBUF),y)
+QT5WEBENGINE_DEPENDENCIES += protobuf
+endif
+
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+QT5WEBENGINE_DEPENDENCIES += snappy
+endif
+
 # QtWebengine's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-- 
2.7.4
