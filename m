From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 15:59:30 +0200
Subject: [Buildroot] [git commit] arc/xtensa: store the Xtensa overlay in
 the per-package DL_DIR
Message-ID: <20180402141058.3227482586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01c1889f9f641f6f8adc0345e17b70e80026554d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
