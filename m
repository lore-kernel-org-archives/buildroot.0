From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:36:53 +0100
Subject: [Buildroot] [PATCH 01/80 v1] package/alsa-lib: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <31ab34780f3feaf81b73768af13ba2ced2f3e90d.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/alsa-lib/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index ebca265..97e8489 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -1,7 +1,7 @@
 comment "alsa-lib needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_ALSA_LIB
+menuconfig BR2_PACKAGE_ALSA_LIB
 	bool "alsa-lib"
 	# Temporary until
 	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
@@ -29,8 +29,6 @@ config BR2_PACKAGE_ALSA_LIB_PYTHON
 	  in the target directory
 	  http://www.alsa-project.org/
 
-menu "ALSA lib selection"
-
 config BR2_PACKAGE_ALSA_LIB_DEVDIR
 	string "directory with ALSA device files"
 	default "/dev/snd"
@@ -77,6 +75,4 @@ config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
 	bool "old-symbols"
 	default y
 
-endmenu
-
 endif
-- 
1.9.1
