From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 23:02:03 +0100
Subject: [Buildroot] [PATCH 03/10] package/powervr: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393365231.git.yann.morin.1998@free.fr>
References: <cover.1393365231.git.yann.morin.1998@free.fr>
Message-ID: <566d55e629a83c3c6d5910fb9aced87ed834cc79.1393365231.git.yann.morin.1998@free.fr>
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
 package/powervr/powervr.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/powervr/powervr.mk b/package/powervr/powervr.mk
index 1f43505..5a55860 100644
--- a/package/powervr/powervr.mk
+++ b/package/powervr/powervr.mk
@@ -4,14 +4,4 @@
 #
 ################################################################################
 
-POWERVR_SOURCE =
-POWERVR_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_POWERVR))
-
-ifeq ($(POWERVR_DEPENDENCIES),)
-define POWERVR_CONFIGURE_CMDS
-	echo "No PowerVR implementation selected. Configuration error."
-	exit 1
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
-- 
1.8.3.2
