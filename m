From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Jul 2016 16:42:19 +0200
Subject: [Buildroot] [PATCH] package/upmpdcli: needs MMU
Message-ID: <1468075339-29551-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... because it uses fork().

Fixes:
    http://autobuild.buildroot.org/results/9ae/9ae5c773e62bbe84f2d0495f074d659fa3dcd55b/
    http://autobuild.buildroot.org/results/8af/8afb9f96bb827b723b859ff73cdf674ca6434e7c/
    http://autobuild.buildroot.org/results/abe/abe9be3b78f26f56035ec805a86ab33b1d145a02/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 3218205..eacfd4d 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_UPMPDCLI
 	bool "upmpdcli"
-	select BR2_PACKAGE_LIBMPDCLIENT
-	select BR2_PACKAGE_LIBUPNPP
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	select BR2_PACKAGE_LIBMPDCLIENT
+	select BR2_PACKAGE_LIBUPNPP
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
-- 
2.7.4
