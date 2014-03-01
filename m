From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 18:32:40 +0100
Subject: [Buildroot] [PATCH 11/17] package/libgles: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393695127.git.yann.morin.1998@free.fr>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
Message-ID: <ad1d3c14be83687365422a1b33146328c2bc72ea.1393695127.git.yann.morin.1998@free.fr>
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
---
 package/opengl/libgles/libgles.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index 041e378..407f8f9 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-LIBGLES_SOURCE =
-LIBGLES_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBGLES))
-
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-ifeq ($(LIBGLES_DEPENDENCIES),)
-$(error No libGLES implementation selected. Configuration error.)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
-- 
1.8.3.2
