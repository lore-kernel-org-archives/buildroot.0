From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] qt: tighten webkit dependencies
Message-ID: <20101127214027.DC0188CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=13a51114c60336def06cfc0a681176ecc7d2fcac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

webkit needs shared library and gui support to build, so make that visible
in Config.in.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 1f8633b..af1db6d 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -335,11 +335,16 @@ config BR2_PACKAGE_QT_NETWORK
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
+	depends on BR2_PACKAGE_QT_SHARED
+	depends on BR2_PACKAGE_QT_GUI_MODULE
 	depends on BR2_PACKAGE_QT_NETWORK
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
+comment "WebKit needs shared library/gui/network support"
+	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
+
 config BR2_PACKAGE_QT_JAVASCRIPTCORE
 	bool "JavaScriptCore JIT compiler"
 	help
-- 
1.7.2.2
