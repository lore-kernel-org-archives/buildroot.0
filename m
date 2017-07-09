From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun,  9 Jul 2017 05:21:57 -0700
Subject: [Buildroot] [PATCH v2 3/7] arch/xtensa: accept the overlay to be
	compressed
In-Reply-To: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1499602921-25097-4-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/arch.mk.xtensa | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 6d9fd63d124a..ecb9c1086a70 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -21,5 +21,7 @@ ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 #   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
 ################################################################################
 define arch-xtensa-overlay-extract
-	tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(1) --strip-components=1 $(2)
+	$(call suitable-extractor,$(ARCH_XTENSA_OVERLAY_FILE)) \
+		$(ARCH_XTENSA_OVERLAY_FILE) | \
+	$(TAR) --strip-components=1 -C $(1) $(TAR_OPTIONS) - $(2)
 endef
-- 
2.1.4
