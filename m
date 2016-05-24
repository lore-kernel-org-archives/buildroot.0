From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 15:16:44 +0200
Subject: [Buildroot] [git commit] qt5serialbus: depend on toolchain headers
	>= 3.6
Message-ID: <20160524131648.76AD881E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=894262695afd13bbf230aa54a188dc8d7c56c727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5serialbus requires CAN FD support, that was introduced
in kernel 3.6. Add appropriate toolchain headers dependency.

Fixes:
http://autobuild.buildroot.net/results/617/6176a24799b5d80312be954089efbbb498fa1571/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5serialbus/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
index 504141c..f5b713d 100644
--- a/package/qt5/qt5serialbus/Config.in
+++ b/package/qt5/qt5serialbus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5SERIALBUS
 	bool "qt5serialbus"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 # CAN FD
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5SERIALPORT
 	help
@@ -9,3 +10,6 @@ config BR2_PACKAGE_QT5SERIALBUS
 	  This package corresponds to the qt5serialbus module.
 
 	  http://qt.io
+
+comment "qt5serialbus needs headers >= 3.6"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
