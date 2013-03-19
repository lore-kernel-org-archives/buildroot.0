From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:29:42 +0100
Subject: [Buildroot] [PATCH v4 09/21] qt5: factor Qt5 version
In-Reply-To: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363721394-14973-10-git-send-email-thomas.petazzoni@free-electrons.com>
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
index f220508..83cc0e1 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,3 +1,4 @@
+QT5_VERSION = 5.0.1
 include package/qt5/*/*.mk
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 83ce999..d22ab66 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QT5BASE_VERSION = 5.0.1
+QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = http://releases.qt-project.org/qt5/$(QT5BASE_VERSION)/submodules_tar/
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
-- 
1.7.9.5
