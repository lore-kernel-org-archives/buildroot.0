From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] midori: make sure it can't be
	selected if webkit can't be enabled
Message-ID: <20100727210247.80981835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b14fe9ca62e03cac3e034ca846acf2a2d9207a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index f9117ea..95a0afb 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -3,7 +3,12 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_INSTALL_LIBSTDCPP # webkit
+	depends on BR2_USE_WCHAR	 # webkit
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
+
+comment "midori requires C++, WCHAR in toolchain and libgtk2"
+        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
-- 
1.7.1
