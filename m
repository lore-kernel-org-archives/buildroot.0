From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:50 +0200
Subject: [Buildroot] [PATCH 39/83 v2] package/flot: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <75b0343f78e51d14650d21f7d1d49c9a935e861d.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

flot has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

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
2.7.4
