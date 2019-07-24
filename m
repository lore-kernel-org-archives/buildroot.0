From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 24 Jul 2019 10:35:35 -0700
Subject: [Buildroot] [RFC PATCH 1/4] llvm: disable bindings on host
In-Reply-To: <20190724173538.22913-1-joseph.kogut@gmail.com>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
Message-ID: <20190724173538.22913-2-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/llvm/llvm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 3c62285188..11c8d90af0 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -184,7 +184,8 @@ LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
 # check preventively. Building the Go and OCaml bindings is yet unsupported.
 HOST_LLVM_CONF_OPTS += \
 	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
-	-DOCAMLFIND=OCAMLFIND-NOTFOUND
+	-DOCAMLFIND=OCAMLFIND-NOTFOUND \
+	-DLLVM_ENABLE_BINDINGS=OFF
 
 # Builds a release host tablegen that gets used during the LLVM build.
 HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
-- 
2.22.0
