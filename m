From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:48 +0100
Subject: [Buildroot] [PATCH v6 26/28] package/qt5virtualkeyboard: Add
 optional dependency on qt5quickcontrols2
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-27-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The basic example depends on qt5quickcontrols2.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 162ed88c8c..ea41b5ff86 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -15,6 +15,10 @@ QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
 QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS2),y)
+QT5VIRTUALKEYBOARD_DEPENDENCIES += qt5quickcontrols2
+endif
+
 QT5VIRTUALKEYBOARD_LICENSE = GPL-3.0
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
-- 
2.25.0
