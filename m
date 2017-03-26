From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:49:22 +0200
Subject: [Buildroot] [git commit] package/binutils: use the Xtensa variables
Message-ID: <20170326135524.68B45803EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12d97d01db7e054447241d1a6af0bb0c258e439e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... instead of re-computing them over-and-over-again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
