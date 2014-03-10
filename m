From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 21:27:47 +0100
Subject: [Buildroot] [PATCH 18/20] package/udev: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <0533dda6be874c12e0d45f9cc94a69bda85f1056.1394482605.git.yann.morin.1998@free.fr>
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
 package/udev/udev.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index f5eeeb4..cc4a6e3 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,13 +4,4 @@
 #
 ################################################################################
 
-UDEV_SOURCE =
-UDEV_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))
-
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-ifeq ($(UDEV_DEPENDENCIES),)
-$(error No Udev implementation selected. Configuration error)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
-- 
1.8.3.2
