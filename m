From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:21:06 +0200
Subject: [Buildroot] [git commit] package/libegl: convert to the
	virtual-package infrastructure
Message-ID: <20140405172339.1C48B9C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30eafe597ff0641654ecb1e1eeef0a652eac455e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
[eric.le.bihan.dev at free.fr: tested on RPi, with Qt5]
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opengl/libegl/libegl.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index 2e399ce..1f5460e 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-LIBEGL_SOURCE =
-LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LIBEGL))
-
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-ifeq ($(LIBEGL_DEPENDENCIES),)
-$(error No libEGL implementation selected. Configuration error.)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
