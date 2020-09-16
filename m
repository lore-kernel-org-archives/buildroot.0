From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Sep 2020 23:11:34 +0200
Subject: [Buildroot] [PATCH 3/3 v4] package/qt5/qt5webengine: fix build
 dependencies for autodetected packages
In-Reply-To: <cover.1600290685.git.yann.morin.1998@free.fr>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
Message-ID: <6efc39e9d97769fae93be2bcb91f56b050dda219.1600290685.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Ford <nford@westpond.com>

Signed-off-by: Nathan Ford <nford@westpond.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5webengine/qt5webengine.mk | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 5df6942977..520d32835b 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -41,6 +41,34 @@ else
 QT5WEBENGINE_CONF_OPTS += -no-webengine-alsa
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
2.20.1
