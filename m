From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:19 +0100
Subject: [Buildroot] [PATCH 49/51] arch/xtensa: accept the overlay to be
	compressed
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <8afae455521ff5bb31fc14f9c6424d140ea7a1ff.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Chris Zankel <chris@zankel.net>
---
 arch/arch.mk.xtensa | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index e60c0b2..238ba24 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -21,7 +21,9 @@ ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 #   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
 ################################################################################
 define arch-xtensa-overlay-extract
-	tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(1) --strip-components=1 $(2)
+	$(call suitable-extractor,$(ARCH_XTENSA_OVERLAY_FILE)) \
+		$(ARCH_XTENSA_OVERLAY_FILE) | \
+	$(TAR) --strip-components=1 -C $(1) $(TAR_OPTIONS) - $(2)
 endef
 
 ################################################################################
-- 
1.9.1
