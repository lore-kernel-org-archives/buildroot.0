From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:04 +0100
Subject: [Buildroot] [PATCH 34/51] package/binutils: use macro to extract
	Xtensa overlay
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <ee75e416897de9c24cbba1ed3571f7e87ac1ac34.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4a67af2..0e488b6 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -92,7 +92,7 @@ endif
 
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define BINUTILS_XTENSA_PRE_PATCH
-	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 binutils
+	$(call arch-xtensa-overlay-extract,$(@D),binutils)
 endef
 BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
-- 
1.9.1
