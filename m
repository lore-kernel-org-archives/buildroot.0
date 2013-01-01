From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 13:34:15 +0100
Subject: [Buildroot] [git commit] spice: entire client support needs
	C++/threads, not just start dialog gui
Message-ID: <20130101130011.AFDC69A586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76d190078dc0960e4278cbcb18c85c0b8e82b47b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/230e6d78e3ec740a7794316cc388c6685e040946

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/spice/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 0c2c7a6..cd91833 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -32,17 +32,17 @@ comment "client depends on X.org"
 config BR2_PACKAGE_SPICE_CLIENT
 	bool "Enable client"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 
-comment "GUI requires a toolchain with threads and C++"
-	depends on BR2_PACKAGE_SPICE_CLIENT
+comment "client requires a toolchain with threads and C++"
+	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SPICE_GUI
 	bool "Enable GUI"
-	depends on BR2_TOOLCHAIN_HAS_THREADS    # cegui06
-	depends on BR2_INSTALL_LIBSTDCPP        # cegui06
 	depends on BR2_PACKAGE_SPICE_CLIENT
 	select BR2_PACKAGE_CEGUI06
 	help
