From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Fri, 31 Aug 2018 16:20:24 +0200
Subject: [Buildroot] [PATCH 3/3] boot/uboot/uboot.mk: substitution for '-I/'
 to '-isystem /' no longer needed
In-Reply-To: <20180831142024.27548-1-david.degrave@mind.be>
References: <20180831142024.27548-1-david.degrave@mind.be>
Message-ID: <20180831142024.27548-3-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the '-isystem' is now used globally, the uboot's substitution to define
HOSTCC is no longer needed too.

This reverts commit 0bf80e4bcd5277e3ad935e03c632deba4c7316f2
         and commit baae5156ce37e8b2775f04710f7d1c8e97e4114c

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bddafe234d..7cb9859565 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -132,7 +132,7 @@ endif
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH) \
-	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
-- 
2.13.6
