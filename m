From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 11 Apr 2013 10:09:04 +0800
Subject: [Buildroot] [PATCH v4 7/7] package: Introduce NOMMU symbol
In-Reply-To: <1365646144-8214-1-git-send-email-sonic.adi@gmail.com>
References: <1365646144-8214-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1365646144-8214-7-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Introduce NOMMU symbol __NOMMU__

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/Makefile.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index f813961..09c0106 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -105,6 +105,9 @@ TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
+
+ifneq ($(BR2_USE_MMU), y)
+TARGET_CFLAGS += -D__NOMMU__
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
-- 
1.7.0.4
