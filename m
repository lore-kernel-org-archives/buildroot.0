From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:52 +0200
Subject: [Buildroot] [PATCH 15/21] package/libopenvg: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <cb78f735b05a7a9e61d09c71408f59be3ece9af8.1396711074.git.yann.morin.1998@free.fr>
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
