From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Sep 2011 09:46:43 +0300
Subject: [Buildroot] [PATCH] toolchain: fix build with empty
	BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS
Message-ID: <6a4325eb6bbe6622b6a8b7d1bc3a7279866e6716.1317019552.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "" string is not equal to the empty string.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a357cb9..3c4ef45 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -131,7 +131,7 @@ CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
-ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
+ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),"")
 TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
 endif
-- 
1.7.6.3
