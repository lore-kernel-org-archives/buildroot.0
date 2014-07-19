From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 16:40:33 +0200
Subject: [Buildroot] [PATCH] pckage/upmpdcli: disable for powerpc CS
	toolchains
Message-ID: <1405780833-10266-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those toolchains use gcc <= 4.5, which is too old as they are missing
range-based for-loops, only introduced with gcc-4.6.

Fixes:
    http://autobuild.buildroot.net/results/f00/f00fa9b83718abaffd1f52dcd50e582434b3c5e2/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>
---
 package/upmpdcli/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index d89928f..3fa638b 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # libupnp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
-- 
1.9.1
