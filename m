From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:00:54 +0200
Subject: [Buildroot] [git commit] xterm: enable for ARC external toolchain
Message-ID: <20180628195835.925DD8364A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c667a10fc396c4dc0b195f0546b8a69e2d2fa944
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the latest prebuilt ARC toolchain this package is building
without any errors.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xterm/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index f3bc4500a8..eaa756a441 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_XTERM
 	bool "xterm"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
-	# ARC toolchain issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
