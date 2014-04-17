From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:59:59 +0200
Subject: [Buildroot] [git commit] package/mesa3d: with a DRI driver,
	is a full OpenGL provider
Message-ID: <20140417210125.5DEAF9C80A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbc989558c2b43fca84e99f11da2ead7f5bfc7bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make mesa3d a provider for full OpenGL, as soon as a DRI driver is enabled.

Full OpenGL is only possible when:
  - a DRI driver is enabled,
  - and X.Org is enabled

Since DRI driver in fact depend on X.Org being enabled in the first place,
we can safely declare mesa3d as a full openGL provider as soon as at least
one DRI driver is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bd7a853..0793b48 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -26,8 +26,12 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
+	select BR2_PACKAGE_HAS_LIBGL
 	bool
 
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_DRI_DRIVER
+
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
