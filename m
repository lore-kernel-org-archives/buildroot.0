From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue, 15 Nov 2016 18:13:04 +0100
Subject: [Buildroot] [Rejected v2 4/7] qt53d/qt5quickcontrols2/qt5serialbus
	: move out of tech preview
In-Reply-To: <20161115171307.7499-1-corjon.j@ecagroup.com>
References: <20161115171307.7499-1-corjon.j@ecagroup.com>
Message-ID: <20161115171307.7499-5-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See http://blog.qt.io/blog/2016/06/16/qt-5-7-released/

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
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
2.9.3
