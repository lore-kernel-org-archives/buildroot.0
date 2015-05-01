From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  1 May 2015 18:19:43 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: remove non-existent
	mips-sf musl toolchains
In-Reply-To: <1430497183-23847-1-git-send-email-arnout@mind.be>
References: <1430497183-23847-1-git-send-email-arnout@mind.be>
Message-ID: <1430497183-23847-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 1.1.6, the mips softfloat toolchains are merged into the mips
toolchain using multilib. Our external toolchain infrastructure copies
the correct version to the target depending on the BR2_SOFT_FLOAT
option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 35bba31..b293ba9 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -367,17 +367,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSIO
 else ifeq ($(BR2_microblazebe),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_mips),y)
-ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-endif # BR2_SOFT_FLOAT
 else ifeq ($(BR2_mipsel),y)
-ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-endif # BR2_SOFT_FLOAT
 else ifeq ($(BR2_powerpc),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_x86_64),y)
-- 
2.1.4
