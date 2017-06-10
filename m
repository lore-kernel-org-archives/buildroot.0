From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 13:53:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: add optional support for
	libunwind
In-Reply-To: <20170610115347.27948-1-bernd.kuhls@t-online.de>
References: <20170610115347.27948-1-bernd.kuhls@t-online.de>
Message-ID: <20170610115347.27948-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added by commit
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=70c272004f727457e852ba5f2498754b07a7d995

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f20d4398b..288406352 100644
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
-- 
2.11.0
