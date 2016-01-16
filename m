From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:36:58 +0100
Subject: [Buildroot] [PATCH 06/80 v1] package/gd: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <81dfc49215386e852f66a964872c9c1077132e54.1452983019.git.yann.morin.1998@free.fr>
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
index e838635..1f466d2 100644
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
1.9.1
