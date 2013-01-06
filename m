From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:19 +0100
Subject: [Buildroot] [PATCH 07/28] xserver_xorg-server: add more
	explanations about the two variants
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4383e0addeae7263c37e627d0df1e42ea73f13d1.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 2382786..6c70196 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -68,12 +68,22 @@ choice
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
 	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	help
+	  This variant of the X.org server is the full-blown variant,
+	  as used by desktop GNU/Linux distributions. The drivers (for
+	  input and graphics) are built separately from the X.org
+	  server (see the xdriver* packages).
 
 comment "X.org requires largefile and C++ support"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	bool "KDrive / TinyX"
+	help
+	  This variant of the X.org server is a lightweight version
+	  intended for embedded systems. The drivers (for input and
+	  graphics) are built into the server. It is generally used
+	  directly on top of the Linux framebuffer.
 
 endchoice
 
-- 
1.7.9.5
