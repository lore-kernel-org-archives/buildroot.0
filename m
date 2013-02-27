From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:26:11 +0100
Subject: [Buildroot] [PATCH 20/30] qt5: factor Qt5 version
In-Reply-To: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362007582-14753-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the Qt5 version will be the same for all Qt5 modules, factor it
in qt5/qt5.mk as QT5_VERSION.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk             |    1 +
 package/qt5/qt5base/qt5base.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index f220508..0c6d0f9 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,3 +1,4 @@
+QT5_VERSION = 5.0.0
 include package/qt5/*/*.mk
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 865377f..0ea15c2 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QT5BASE_VERSION = 5.0.0
+QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = http://releases.qt-project.org/qt5/$(QT5BASE_VERSION)/submodules_tar/
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
-- 
1.7.9.5
