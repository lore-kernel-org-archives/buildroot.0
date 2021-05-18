From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 23:19:47 +0200
Subject: [Buildroot] [git commit branch/next] package/rustc: prepare for
 musl-based platforms support
Message-ID: <20210518205132.4520283643@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf30776057ef137365a3b4701ab89ed29df578db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The current rustc package only supports configurations based on glibc
and hardcodes this requirement. This patch prepares the addition of
support for musl-based platforms by using $(LIBC) instead of
hardcoding "gnu" as the C library specifier when defining
RUSTC_TARGET_NAME.

Signed-off-by: Nathaniel Husted <nathaniel.husted@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
