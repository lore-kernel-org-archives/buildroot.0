From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:34 +0200
Subject: [Buildroot] [PATCH 11/12 v8] package/qt5base: optionally use libudev
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <57ba62d716e2d0439e6bb3fd3d7ae80fb5127869.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base only requires libudev, not a full udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E. MORIN" <yann.morin@orange.com>
---
 package/qt5/qt5base/qt5base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bf541b0..1b46a31 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -59,8 +59,8 @@ ifneq ($(QT5BASE_CONFIG_FILE),)
 QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-QT5BASE_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+QT5BASE_DEPENDENCIES += libudev
 endif
 
 # Qt5 SQL Plugins
-- 
2.7.4
