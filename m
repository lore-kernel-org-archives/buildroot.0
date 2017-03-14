From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:42 -0700
Subject: [Buildroot] [PATCH 13/23] package/binutils: use the Xtensa macro
	generators
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-14-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/binutils/binutils.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 7dfe4db..a7a8f86 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -121,13 +121,10 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define BINUTILS_XTENSA_OVERLAY_EXTRACT
-	$(call arch-xtensa-overlay-extract,$(@D),binutils)
-endef
-BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
-HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
-endif
+BINUTILS_ARCH_XTENSA_OVERLAY_COMPONENT = binutils
+HOST_BINUTILS_ARCH_XTENSA_OVERLAY_COMPONENT = binutils
+$(eval $(arch-xtensa-overlay))
+$(eval $(host-arch-xtensa-overlay))
 
 ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
 HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
-- 
2.1.4
