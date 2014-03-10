From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 21:27:43 +0100
Subject: [Buildroot] [PATCH 14/20] package/libopenvg: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <dde479847cae1b9a83dcd887331c59821b369552.1394482605.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opengl/libopenvg/libopenvg.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index 1c6f929..3ce85a1 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-LIBOPENVG_SOURCE =
-LIBOPENVG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBOPENVG))
-
-ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-ifeq ($(LIBOPENVG_DEPENDENCIES),)
-$(error No libOpenVG implementation selected. Configuration error.)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
-- 
1.8.3.2
