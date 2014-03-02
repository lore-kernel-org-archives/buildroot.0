From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 17:52:52 +0100
Subject: [Buildroot] [PATCH 11/19] package/opengl-libgles: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <953aa9dab9862c294ebf064ec4b55604923d74a0.1393778339.git.yann.morin.1998@free.fr>
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
 package/opengl/opengl-libgles/opengl-libgles.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/opengl/opengl-libgles/opengl-libgles.mk b/package/opengl/opengl-libgles/opengl-libgles.mk
index 357bfd5..6929762 100644
--- a/package/opengl/opengl-libgles/opengl-libgles.mk
+++ b/package/opengl/opengl-libgles/opengl-libgles.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-OPENGL_LIBGLES_SOURCE =
-OPENGL_LIBGLES_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_OPENGL_LIBGLES))
-
-ifeq ($(BR2_PACKAGE_HAS_OPENGL_LIBGLES),y)
-ifeq ($(OPENGL_LIBGLES_DEPENDENCIES),)
-$(error No libGLES implementation selected. Configuration error.)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
-- 
1.8.3.2
