From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:47 -0700
Subject: [Buildroot] [PATCH 18/23] arch/xtensa: accept the overlay to be
	compressed
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-19-git-send-email-jcmvbkbc@gmail.com>
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
index 12c2d4e..a346e31 100644
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
2.1.4
