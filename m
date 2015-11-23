From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:08 +0100
Subject: [Buildroot] [PATCH 38/51] pacage/gcc: use macro to install Xtensa
	overlay legal-info
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <49458525c0e748261b1029c81e616a58590a9f78.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc/gcc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gcc/gcc/gcc.mk b/package/gcc/gcc/gcc.mk
index 57f316b..ce6402a 100644
--- a/package/gcc/gcc/gcc.mk
+++ b/package/gcc/gcc/gcc.mk
@@ -30,8 +30,7 @@ ifneq ($(ARCH_XTENSA_CORE_NAME),)
 HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
 
 define HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
-	$(Q)$(call hardlink-copy,$(ARCH_XTENSA_OVERLAY_TAR),\
-				 $(HOST_GCC_REDIST_SOURCES_DIR))
+	$(Q)$(call arch-xtensa-overlay-legal-info,$(HOST_GCC_REDIST_SOURCES_DIR))
 endef
 HOST_GCC_POST_LEGAL_INFO_HOOKS += HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
 
-- 
1.9.1
