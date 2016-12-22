From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 22 Dec 2016 15:21:09 +0100
Subject: [Buildroot] [PATCH v4 03/10] qt53d/qt5quickcontrols2/qt5serialbus :
	move out of tech preview
In-Reply-To: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
References: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1482416476-20306-4-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Corjon <corjon.j@ecagroup.com>

See http://blog.qt.io/blog/2016/06/16/qt-5-7-released/

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 7fe0bfc..18dad52 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -31,6 +31,7 @@ menuconfig BR2_PACKAGE_QT5
 	  http://qt.io
 
 if BR2_PACKAGE_QT5
+source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
@@ -40,7 +41,9 @@ source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
+source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5sensors/Config.in"
+source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
@@ -48,10 +51,6 @@ source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
-comment "technology preview"
-source "package/qt5/qt53d/Config.in"
-source "package/qt5/qt5quickcontrols2/Config.in"
-source "package/qt5/qt5serialbus/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5script/Config.in"
-- 
1.9.1
