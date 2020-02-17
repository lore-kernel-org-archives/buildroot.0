From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:46 +0100
Subject: [Buildroot] [PATCH v6 24/28] package/qt5webengine: Add optional
 dependency on qt5quickcontrols2
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-25-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recipebrowser example depends on qt5quickcontrols2.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5webengine/qt5webengine.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index cd7a0ba81c..c27bf85908 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -42,6 +42,10 @@ else
 QT5WEBENGINE_CONF_OPTS += QT_CONFIG-=alsa
 endif
 
+ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS2),y)
+QT5WEBENGINE_DEPENDENCIES += qt5quickcontrols2
+endif
+
 # QtWebengine's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-- 
2.25.0
