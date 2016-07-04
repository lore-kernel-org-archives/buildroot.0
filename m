From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 17:23:07 +0200
Subject: [Buildroot] [git commit] package/gd: use 'menuconfig' instead of
	'config'+'menu'
Message-ID: <20160704152319.0D007819EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97f74bf4f728819cfd630c4e425d2117148831e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop tools comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/gd/Config.in b/package/gd/Config.in
index 28b0b0f..861cef8 100644
--- a/package/gd/Config.in
+++ b/package/gd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GD
+menuconfig BR2_PACKAGE_GD
 	bool "gd"
 	help
 	  GD is a graphics library. It allows your code to quickly
@@ -12,8 +12,6 @@ config BR2_PACKAGE_GD
 
 if BR2_PACKAGE_GD
 
-menu "gd tools"
-
 config BR2_PACKAGE_GD_ANNOTATE
 	bool "annotate"
 
@@ -57,6 +55,4 @@ config BR2_PACKAGE_GD_WEBPNG
 	bool "webpng"
 	select BR2_PACKAGE_LIBPNG
 
-endmenu
-
 endif
