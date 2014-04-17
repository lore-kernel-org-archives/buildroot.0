From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:01:06 +0200
Subject: [Buildroot] [git commit] xapp_xdriinfo: depends on the virtual
	package libgl
Message-ID: <20140417210125.736989C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e49a0c656a1a27b80bca730f40101f6ff37d42af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/90a/90a8226a8a2978eb13d02645cb9e3d95d9b95757/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: fix comment, trim the commit log from unneeded info]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xdriinfo/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 970bff5..36dc577 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  query configuration information of DRI drivers
+
+comment "xdriinfo needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
