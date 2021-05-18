From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 22:54:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/rustc: prepare for musl-based
 platforms support
In-Reply-To: <20210518205432.133118-1-thomas.petazzoni@bootlin.com>
References: <20210518205432.133118-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210518205432.133118-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathaniel Husted <nathaniel.husted@outlook.com>

The current rustc package only supports configurations based on glibc
and hardcodes this requirement. This patch prepares the addition of
support for musl-based platforms by using $(LIBC) instead of
hardcoding "gnu" as the C library specifier when defining
RUSTC_TARGET_NAME.

Signed-off-by: Nathaniel Husted <nathaniel.husted@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/rustc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 35ffc36106..52860b7eff 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -8,7 +8,7 @@ RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
 RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
+RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)
 endif
 
 ifeq ($(HOSTARCH),x86)
-- 
2.31.1
