From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 18:01:12 +0100
Subject: [Buildroot] [git commit] qt: add missing select BR2_PACKAGE_TSLIB
Message-ID: <20151230170137.766AF7F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fa6e2444504752320c8d2f18301251ce0305557
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/36c/36c56d10abcf96afd389f2ebe8db4dc13659997b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.mouse.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 16c41c1..11da956 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -11,6 +11,11 @@ config BR2_PACKAGE_QT_MOUSE_LINUXINPUT
 
 config BR2_PACKAGE_QT_MOUSE_TSLIB
 	bool "tslib"
+	select BR2_PACKAGE_TSLIB
+	depends on !BR2_STATIC_LIBS # tslib
+
+comment "tslib support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_QT_MOUSE_QVFB
 	bool "qvfb"
