From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:21:03 +0200
Subject: [Buildroot] [git commit] package/powervr: convert to the
	virtual-package infrastructure
Message-ID: <20140405172339.07A859C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b624de63a460194b0957bfd42b6bf51d0f4b98b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powervr/powervr.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/powervr/powervr.mk b/package/powervr/powervr.mk
index b36eb16..5a55860 100644
--- a/package/powervr/powervr.mk
+++ b/package/powervr/powervr.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-POWERVR_SOURCE =
-POWERVR_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_POWERVR))
-
-ifeq ($(BR2_PACKAGE_HAS_POWERVR),y)
-ifeq ($(POWERVR_DEPENDENCIES),)
-$(error No PowerVR implementation selected. Configuration error.)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
