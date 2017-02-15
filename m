From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 16:30:48 +0100
Subject: [Buildroot] [PATCH 2/2] mesa3d-headers: remove installation of
	OpenVG headers
In-Reply-To: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1487172648-5292-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenVG support has been completely removed from mesa3d in commit
3acd7a34ab05b87521b74f626ec637e7fdcc6595, merged in mesa-10.6.0.

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
-- 
2.7.4
