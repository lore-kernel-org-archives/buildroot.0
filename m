From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:01:50 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add optional support for
	libunwind
Message-ID: <20170610210157.71E2B7F8DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=732268f2a1adafcefb943c458e93470174c14472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added by commit
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=70c272004f727457e852ba5f2498754b07a7d995

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f20d439..2884063 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -189,6 +189,13 @@ else
 MESA3D_CONF_OPTS += --disable-xvmc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+MESA3D_CONF_OPTS += --enable-libunwind
+MESA3D_DEPENDENCIES += libunwind
+else
+MESA3D_CONF_OPTS += --disable-libunwind
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
 MESA3D_DEPENDENCIES += libvdpau
 MESA3D_CONF_OPTS += --enable-vdpau
