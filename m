From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:15 +0200
Subject: [Buildroot] [PATCH 04/83 v2] package/gd: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <9f7e2cbc99ed22ceaab8e2d35f53736d5fbaae42.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1:
  - typo in title  (Arnout)
---
 package/gd/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gd/Config.in b/package/gd/Config.in
index 28b0b0f..092bc06 100644
--- a/package/gd/Config.in
+++ b/package/gd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GD
+menuconfig BR2_PACKAGE_GD
 	bool "gd"
 	help
 	  GD is a graphics library. It allows your code to quickly
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GD
 
 if BR2_PACKAGE_GD
 
-menu "gd tools"
+comment "gd tools"
 
 config BR2_PACKAGE_GD_ANNOTATE
 	bool "annotate"
@@ -57,6 +57,4 @@ config BR2_PACKAGE_GD_WEBPNG
 	bool "webpng"
 	select BR2_PACKAGE_LIBPNG
 
-endmenu
-
 endif
-- 
2.7.4
