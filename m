From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:49 +0100
Subject: [Buildroot] [PATCH v6 27/28] package/qt53d: Add optional dependency
 on qt5multimedia
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-28-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The audio-visualizer-qml example depends on it.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt53d/qt53d.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index eeb1b3644c..c9db7cd0d7 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -10,6 +10,10 @@ QT53D_SOURCE = qt3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT53D_VERSION).tar.xz
 QT53D_DEPENDENCIES = qt5base qt5declarative
 QT53D_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_QT5MULTIMEDIA),y)
+QT53D_DEPENDENCIES += qt5multimedia
+endif
+
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
 endif
-- 
2.25.0
