From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed,  8 Feb 2017 02:23:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/qt5: remove menu comment about
	depreceted modules
In-Reply-To: <1486517040-8075-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1486517040-8075-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1486517040-8075-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As now the Qt version is configurable to simplify the menu display
logic we remove the menu comment about deprecated modules and
indicate it in the relevant modules' help text instead

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/qt5/Config.in            | 7 +++----
 package/qt5/qt5enginio/Config.in | 3 +++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6929434..3b2c724 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -57,23 +57,22 @@ source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
+source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
+source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
+source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
-comment "legacy compatibility"
-source "package/qt5/qt5enginio/Config.in"
-source "package/qt5/qt5script/Config.in"
-source "package/qt5/qt5webkit/Config.in"
 endif
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index fcb866c..dba75e2 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -10,4 +10,7 @@ config BR2_PACKAGE_QT5ENGINIO
 
 	  This package corresponds to the qt5enginio module.
 
+	  This package has been tagged as deprecated since version
+	  5.6 and not recommended for new design.
+
 	  http://qt.io
-- 
2.7.4
