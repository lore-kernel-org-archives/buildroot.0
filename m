From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 22:46:56 +0100
Subject: [Buildroot] [git commit] package/llvm: remove outdated variables
 disabling bindings
Message-ID: <20200318215635.7BB3A82624@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d554772185a616725bf8a2d742358791f469c361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LLVM no longer disables unsupported bindings by overriding OCAMLFIND and
GO_EXECUTABLE, so remove them.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/llvm.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index f1034f0365..24d033d124 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -189,11 +189,8 @@ LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
 # This solves "No available targets are compatible for this triple" with llvmpipe
 LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
 
-# The Go bindings have no CMake rules at the moment, but better remove the
-# check preventively. Building the Go and OCaml bindings is yet unsupported.
+# Building the Go and OCaml bindings is yet unsupported.
 HOST_LLVM_CONF_OPTS += \
-	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
-	-DOCAMLFIND=OCAMLFIND-NOTFOUND \
 	-DLLVM_ENABLE_BINDINGS=OFF
 
 # Builds a release host tablegen that gets used during the LLVM build.
