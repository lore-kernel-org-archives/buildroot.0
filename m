From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Dec 2011 08:58:40 +0100
Subject: [Buildroot] [git commit] xinput-calibrator: needs C++ support
Message-ID: <20111212075903.AE5338F933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40955025d880ca9029dc7d4bcfc5fec3750718fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xinput_calibrator/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xinput_calibrator/Config.in b/package/x11r7/xapp_xinput_calibrator/Config.in
index 47c607c..ac98b8d 100644
--- a/package/x11r7/xapp_xinput_calibrator/Config.in
+++ b/package/x11r7/xapp_xinput_calibrator/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR
 	bool "xinput-calibrator"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
 	help
@@ -7,3 +8,5 @@ config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR
 
 	  http://www.freedesktop.org/wiki/Software/xinput_calibrator
 
+comment "xinput-calibrator requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
