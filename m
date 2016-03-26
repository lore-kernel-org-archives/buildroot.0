From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:54:25 +0100
Subject: [Buildroot] [git commit] Revert "package/x11r7/xserver_xorg-server:
	dri needs arm >= v6"
Message-ID: <20160326175430.5236D80E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbbbd0e1250a2918b449ec41a72d434903f19ff5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7bac31ceea1b52986b1773a1bd4841110672f923.

This commit is no longer needed, since libdrm no longer needs arm >=
v6 support thanks to the fix to the CAS implementation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 3f6cda7..617bcbc 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -130,8 +130,7 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-# libdrm locking macros use armv6+ instructions on arm
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)n$(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),yn)
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
