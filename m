From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Sep 2013 13:25:30 +0200
Subject: [Buildroot] [git commit] qt: needs threads
Message-ID: <20130924112600.B60229B85D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfcb93aa5cfead618335aa2d30adc3f60a2b2d0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/489/489f3ddcd023e6d1eaf8efa1da99d726f60da921/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 35e8208..2afbd92 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,10 +1,11 @@
-comment "qt requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "qt requires a toolchain with C++ and threads support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT
 	bool "Qt"
 	depends on !BR2_avr32 # lacks TLS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
