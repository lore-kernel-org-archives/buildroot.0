From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:16:24 +0200
Subject: [Buildroot] [git commit] package/llvm: fix typo in llvm.mk
Message-ID: <20180412191631.D0C8A80F96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62285fbe46c8d740aeabb9563204d7d74b5629f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"+=" was missing in -DLLVM_TARGETS_TO_BUILD, so LLVM_CONF_OPTS and
HOST_LLVM_CONF_OPTS before this option weren't being considered.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/llvm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index de2ca38da1..a25495fbd7 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -40,8 +40,8 @@ LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
 # Build backend for target architecture. This include backends like AMDGPU.
 LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
-HOST_LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
-LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 
 # LLVM target to use for native code generation. This is required for JIT generation.
 # It must be set to LLVM_TARGET_ARCH for host and target, otherwise we get
