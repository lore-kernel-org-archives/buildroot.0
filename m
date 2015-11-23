From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:09 +0100
Subject: [Buildroot] [PATCH 39/51] package/binutils: use macro to install
	Xtensa overlay legal-info
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <cfe5169bc2d745dc72a0b2675a6b9bd3cd9f7e23.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0e488b6..4740305 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -96,6 +96,11 @@ define BINUTILS_XTENSA_PRE_PATCH
 endef
 BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
+define BINUTILS_XTENSA_LEGAL_INFO
+	$(call arch-xtensa-overlay-legal-info,$($(PKG)_REDIST_SOURCES_DIR))
+endef
+BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_LEGAL_INFO
+HOST_BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_LEGAL_INFO
 endif
 
 ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
-- 
1.9.1
