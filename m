From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 May 2011 17:21:06 +0200
Subject: [Buildroot] [git commit] qt: hide shared library option if
	BR2_PREFER_STATIC_LIB
Message-ID: <20110512153806.E6EB0834D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5db57b7ac9fc8c5bd0bec6e06166443f04870a3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index b223772..eafc855 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -23,12 +23,12 @@ config BR2_PACKAGE_QT_DEMOS
 
 choice
 	prompt "Library type"
-	default BR2_PACKAGE_QT_SHARED
 	help
 	  Selects the library type: Shared or Static
 
 config BR2_PACKAGE_QT_SHARED
 	bool "Shared library"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Create and use shared Qt libraries.
 	  If you have multiple programs that depend on Qt or intend to use
-- 
1.7.3.4
