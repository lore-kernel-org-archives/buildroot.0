From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 13:49:55 +0200
Subject: [Buildroot] [git commit] poppler: needs thread support
Message-ID: <20131014120816.AB33E9B9FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e0613aa8eadf16383410eb764f10ca99e549fb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix:
http://autobuild.buildroot.net/results/daa/daa18f112ddd08644b4149025899cea2b511a9da/

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 6a9e1fd..876601e 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_POPPLER
 	bool "poppler"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
@@ -9,5 +10,5 @@ config BR2_PACKAGE_POPPLER
 
 	   http://poppler.freedesktop.org/
 
-comment "poppler requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "poppler requires a toolchain with C++ and thread support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
