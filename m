From: Will Newton <will.newton@gmail.com>
Date: Fri, 26 Nov 2010 13:01:16 +0000
Subject: [Buildroot] [PATCH] package/qt: Remove selects of
	BR2_PACKAGE_QT_JAVASCRIPTCORE.
Message-ID: <AANLkTimdTU9wzUexhTtWEOea1mVV7_gO0Cc9ReAj7S5e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building WebKit or Script engine support would select JIT support
in JavaScriptCore. Not all platforms support JIT, so remove the
selects to allow the option to be modified by users.
---
 package/qt/Config.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 50c2929..1f8633b 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -336,7 +336,6 @@ config BR2_PACKAGE_QT_NETWORK
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
 	depends on BR2_PACKAGE_QT_NETWORK
-	select BR2_PACKAGE_QT_JAVASCRIPTCORE
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
@@ -366,7 +365,6 @@ config BR2_PACKAGE_QT_OPENSSL
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
 	default y
-	select BR2_PACKAGE_QT_JAVASCRIPTCORE
 	help
 	  Build the Qt Script module.
 	  if unsure, say y.
-- 
1.7.2.2
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-qt-Remove-selects-of-BR2_PACKAGE_QT_JAVASCRI.patch
Type: text/x-patch
Size: 1105 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101126/bb9170a1/attachment.bin>
