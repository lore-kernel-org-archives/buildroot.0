From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:21:07 +0200
Subject: [Buildroot] [git commit] package/libopenmax: convert to the
	virtual-package infrastructure
Message-ID: <20140405172339.252A29C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e56f0e0429d8b550bbfdd5f6f8aceee24ada06a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opengl/libopenmax/libopenmax.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
index 6cdeacd..bc2e7f8 100644
--- a/package/opengl/libopenmax/libopenmax.mk
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-LIBOPENMAX_SOURCE =
-LIBOPENMAX_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBOPENMAX))
-
-ifeq ($(BR2_PACKAGE_HAS_LIBOPENMAX),y)
-ifeq ($(LIBOPENMAX_DEPENDENCIES),)
-$(error No libopenmax implementation selected. Configuration error.)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
