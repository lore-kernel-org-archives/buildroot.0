From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 13:27:56 +0100
Subject: [Buildroot] [PATCH 2/4] llvm: enable bpf
In-Reply-To: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103122758.10578-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BPF (in-kernel bytecode machine) is needed by libv4l

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/llvm/llvm.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 1f9bd447f5..dae5d3f16d 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -54,6 +54,9 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
 LLVM_TARGETS_TO_BUILD += AMDGPU
 endif
 
+# Build BPF (in-kernel bytecode machine)
+LLVM_TARGETS_TO_BUILD += BPF
+
 # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
 
-- 
2.17.1
