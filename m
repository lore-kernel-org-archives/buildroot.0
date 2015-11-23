From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:06 +0100
Subject: [Buildroot] [PATCH 36/51] package/gcc: use macro to extract Xtensa
	overlay
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <65cac44e5505ff2b89be0085ecc30eebc89db28a.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc-common.mk b/package/gcc/gcc-common.mk
index b78dd84..35f33e5 100644
--- a/package/gcc/gcc-common.mk
+++ b/package/gcc/gcc-common.mk
@@ -25,7 +25,7 @@ endif
 # Xtensa special hook
 #
 define HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
-	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
+	$(call arch-xtensa-overlay-extract,$(@D),gcc)
 endef
 
 #
-- 
1.9.1
