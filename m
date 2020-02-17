From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:47 +0100
Subject: [Buildroot] [PATCH v6 25/28] package/qt5webengine: Add optional
 dependency on qt5location
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-26-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the webenginewidgets maps example depends on it

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5webengine/qt5webengine.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index c27bf85908..e0b39c354f 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -46,6 +46,11 @@ ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS2),y)
 QT5WEBENGINE_DEPENDENCIES += qt5quickcontrols2
 endif
 
+ifeq ($(BR2_PACKAGE_QT5LOCATION),y)
+QT5WEBENGINE_DEPENDENCIES += qt5location
+endif
+
+
 # QtWebengine's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-- 
2.25.0
