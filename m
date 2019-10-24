From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 24 Oct 2019 16:06:07 -0700
Subject: [Buildroot] [PATCH 1/1] llvm: disable bindings on host
Message-ID: <20191024230607.986468-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additionally, remove GO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND and
OCAMLFIND=OCAMLFIND-NOTFOUND, as these options are no longer necessary.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

 package/llvm/llvm.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 4d9bb1d12f..72c6f36414 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -189,11 +189,9 @@ LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
 # This solves "No available targets are compatible for this triple" with llvmpipe
 LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
 
-# The Go bindings have no CMake rules at the moment, but better remove the
-# check preventively. Building the Go and OCaml bindings is yet unsupported.
+# Building the Go and OCaml bindings is yet unsupported.
 HOST_LLVM_CONF_OPTS += \
-	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
-	-DOCAMLFIND=OCAMLFIND-NOTFOUND
+	-DLLVM_ENABLE_BINDINGS=OFF
 
 # Builds a release host tablegen that gets used during the LLVM build.
 HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
-- 
2.23.0
