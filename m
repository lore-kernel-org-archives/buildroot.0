From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 18:32:39 +0100
Subject: [Buildroot] [PATCH 10/17] package/powervr: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1393695127.git.yann.morin.1998@free.fr>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
Message-ID: <cc4fada2d5fe2af5073f21d80c718e9662a7d4a5.1393695127.git.yann.morin.1998@free.fr>
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
 package/powervr/powervr.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

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
-- 
1.8.3.2
