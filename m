From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:23:58 +0200
Subject: [Buildroot] [v3 04/13] arc/xtensa: store the eXtensa overlay in the
 per-package DL_DIR
In-Reply-To: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180331142407.9522-4-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 arch/arch.mk.xtensa | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 2b6cd26d03..fd410f6bfa 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -12,7 +12,7 @@
 BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
 ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
-ARCH_XTENSA_OVERLAY_FILE = $(DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
+ARCH_XTENSA_OVERLAY_FILE = $($(PKG)_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
 # Do not check that file, we can't know its hash
 BR_NO_CHECK_HASH_FOR += $(notdir $(ARCH_XTENSA_OVERLAY_URL))
 else
-- 
2.16.2
