From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 20:59:23 +0100
Subject: [Buildroot] [git commit] xterm: disable with ARC external toolchain
Message-ID: <20170228200410.A00F182145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f920873b412900df8060573c11f800ccfc324edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package fails when building with ARC external toolchain

Marking this with special comment "# ARC toolchain issue" as the package
is to be enabled as soon as the issue with the ARC toolchain is
resolved.

Fixes:
  http://autobuild.buildroot.net/results/28a/28a92049a6ceef005787c5779f77ecf3fe8ad642//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
