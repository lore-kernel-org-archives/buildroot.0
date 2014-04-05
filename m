From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:56 +0200
Subject: [Buildroot] [PATCH 19/21] package/udev: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <be478db481b41c0874c6acbf4759cb1bb3c15fce.1396711074.git.yann.morin.1998@free.fr>
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
[eric.le.bihan.dev at free.fr: tested with both systemd and eudev, on QEMU x86]
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
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
