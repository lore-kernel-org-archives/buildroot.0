From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 21:27:44 +0100
Subject: [Buildroot] [PATCH 15/20] package/luainterpreter: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <cadaa0359a20c4667e7366fe2be1a0b9cc99f9d5.1394482605.git.yann.morin.1998@free.fr>
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
Cc: Francois Perrad <fperrad@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/luainterpreter/luainterpreter.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index 40d4290..aa02696 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -4,15 +4,6 @@
 #
 ################################################################################
 
-LUAINTERPRETER_SOURCE =
-LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
-
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
-ifeq ($(LUAINTERPRETER_DEPENDENCIES),)
-$(error No lua interpreter implementation selected. Configuration error.)
-endif
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
-- 
1.8.3.2
