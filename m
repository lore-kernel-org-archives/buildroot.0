From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Feb 2012 17:14:39 +0100
Subject: [Buildroot] [git commit] mesa3d: don't depend on the X server
Message-ID: <20120206190750.3B69E909EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80a7e8216e53cd7195e78e30e90821584b537b53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no particular reason why you shouldn't be able to build mesa
without the X server (E.G. for remote X), so remove it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 596eea3..47ded29 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	depends on BR2_PACKAGE_XSERVER_xorg
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
