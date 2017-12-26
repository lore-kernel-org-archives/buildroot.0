From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2017 00:39:02 +0100
Subject: [Buildroot] [PATCH 2/4] legacy: drop 2012.11 entries
In-Reply-To: <cover.1514331522.git.yann.morin.1998@free.fr>
References: <cover.1514331522.git.yann.morin.1998@free.fr>
Message-ID: <dc95d913a5649eeedef6ea00c5d45bf938236b59.1514331522.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those entries are older than 5 years, we can drop them now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 47b495667d..4efce8015b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3130,42 +3130,6 @@ config BR2_PACKAGE_DIRECTB_TESTS
 	  The option has been renamed
 	  BR2_PACKAGE_DIRECTFB_TESTS.
 
-###############################################################################
-comment "Legacy options removed in 2012.11"
-
-config BR2_PACKAGE_CUSTOMIZE
-	bool "customize package has been removed"
-	select BR2_LEGACY
-	help
-	  The 'customize' special package has been removed. Instead,
-	  we recommend to create either your own packages, or use a
-	  post-build script to customize your root filesystem. See
-	  Buildroot's documentation for more details.
-
-config BR2_PACKAGE_XSERVER_xorg
-	bool "X.org modular server"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR.
-
-config BR2_PACKAGE_XSERVER_tinyx
-	bool "KDrive / TinyX server"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE.
-
-config BR2_PACKAGE_PTHREAD_STUBS
-	bool "pthread-stubs option has been renamed"
-	select BR2_LEGACY
-	select BR2_PACKAGE_LIBPTHREAD_STUBS
-	help
-	  For consistency reason, the pthread-stubs package has been
-	  renamed to libpthread-stubs.
-
 endmenu
 
 endif # !SKIP_LEGACY
-- 
2.11.0
