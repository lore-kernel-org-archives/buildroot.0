From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 12 Apr 2018 14:02:36 +0200
Subject: [Buildroot] [PATCH] package/llvm: fix typo in llvm.mk
Message-ID: <20180412120236.1499-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"+=" was missing in -DLLVM_TARGETS_TO_BUILD, so LLVM_CONF_OPTS and
HOST_LLVM_CONF_OPTS before this option weren't being considered.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/llvm/llvm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 4b4f96e5f1..d19f8a0b87 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -42,8 +42,8 @@ LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
 # Build backend for target architecture. This include backends like AMDGPU.
 LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
-HOST_LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
-LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 
 # LLVM target to use for native code generation. This is required for JIT generation.
 # It must be set to LLVM_TARGET_ARCH for host and target, otherwise we get
-- 
2.14.3
