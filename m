From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:32:56 +0100
Subject: [Buildroot] [git commit] xserver_xorg-server: add more explanations
	about the two variants
Message-ID: <20130112215435.B12189001F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cd8be320c9732645ebfcf5d28a21b8df0a63bf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjust help text according to Arnout's comments]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 053dd81..c192ef4 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -68,12 +68,23 @@ choice
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
 	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	help
+	  This variant of the X.org server is the full-blown variant,
+	  as used by desktop GNU/Linux distributions. The drivers (for
+	  input and graphics) are built separately from the X.org
+	  server (see the xdriver* packages).
 
-comment "X.org requires largefile and C++ support"
+comment "Modular X.org requires largefile and C++ support"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	bool "KDrive / TinyX"
+	help
+	  This variant of the X.org server is a lightweight version
+	  intended for embedded systems. The drivers (for input and
+	  graphics) are built into the server. It is generally used
+	  directly on top of the Linux framebuffer without DRM or
+	  video card specific drivers.
 
 endchoice
 
