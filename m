From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Tue, 28 Feb 2017 18:20:16 +0300
Subject: [Buildroot] [PATCH] xterm: disable with ARC external toolchain
Message-ID: <1488295216-26882-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package fails when building with ARC external toolchain

Marking this with special comment "# ARC toolchain issue" as the package
is to be enabled as soon as the issue with the ARC toolchain is
resolved.

Fixes:
  http://autobuild.buildroot.net/results/28a/28a92049a6ceef005787c5779f77ecf3fe8ad642//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/xterm/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index e17d2c6..f11aafa 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_XTERM
 	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	# ARC toolchain issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	help
 	  xterm terminal emulator
 
-- 
2.7.4
