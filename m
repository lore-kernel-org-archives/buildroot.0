From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:35 +0100
Subject: [Buildroot] [PATCH 43/80 v1] package/flot: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <295f568c87969a4ed7d42868cd3c38d6e7d14c7c.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

flot has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/flot/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/flot/Config.in b/package/flot/Config.in
index 4c0d3ec..0037ff2 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_FLOT
+menuconfig BR2_PACKAGE_FLOT
 	bool "flot"
 	select BR2_PACKAGE_JQUERY
 	help
@@ -18,8 +18,6 @@ config BR2_PACKAGE_FLOT
 
 if BR2_PACKAGE_FLOT
 
-comment "flot plugins"
-
 config BR2_PACKAGE_FLOT_CANVAS
 	bool "canvas"
 	help
-- 
1.9.1
