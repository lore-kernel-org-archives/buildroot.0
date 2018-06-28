From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 28 Jun 2018 13:57:00 +0300
Subject: [Buildroot] [PATCH 3/3] xterm: enable for ARC external toolchain
In-Reply-To: <20180628105700.29015-1-didin@synopsys.com>
References: <20180628105700.29015-1-didin@synopsys.com>
Message-ID: <20180628105700.29015-4-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the latest prebuilt ARC toolchain this package is building
without any errors.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
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
-- 
2.17.1
