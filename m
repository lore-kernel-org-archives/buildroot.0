From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:27:01 +0100
Subject: [Buildroot] [git commit] mesa3d-headers: remove installation of
	OpenVG headers
Message-ID: <20170215202740.3F75F821D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8988e43dc19d5a42f1d8bf606df596ae5b928ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenVG support has been completely removed from mesa3d in commit
3acd7a34ab05b87521b74f626ec637e7fdcc6595, merged in mesa-10.6.0.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 7ae5966..35b1a71 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -62,10 +62,6 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MESA3D_HEADERS_DIRS += GLES GLES2
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-MESA3D_HEADERS_DIRS += VG
-endif
-
 define MESA3D_HEADERS_BUILD_CMDS
 	$(MESA3D_HEADERS_BUILD_DRI_PC)
 endef
