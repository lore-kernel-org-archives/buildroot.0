From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:32 -0700
Subject: [Buildroot] [PATCH 03/23] package/binutils: use the Xtensa variables
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-4-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... instead of re-computing them over-and-over-again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/binutils/binutils.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6d29f24..914393e 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -121,11 +121,9 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
-XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
-ifneq ($(XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define BINUTILS_XTENSA_PRE_PATCH
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
-		-C $(@D) --strip-components=1 binutils
+	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 binutils
 endef
 BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
-- 
2.1.4
