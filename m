From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun,  7 Apr 2019 16:26:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/clang: bump to 8.0.0
In-Reply-To: <20190407142611.19372-1-valentinkorenblit@gmail.com>
References: <20190407142611.19372-1-valentinkorenblit@gmail.com>
Message-ID: <20190407142611.19372-2-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clang no longer needs llvm-config. It now looks for LLVMConfig.cmake,
which is specified by LLVM_DIR option.

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/clang/clang.hash | 4 ++--
 package/clang/clang.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index fe868f5874..405e22ce22 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 a45b62dde5d7d5fdcdfa876b0af92f164d434b06e9e89b5d0b1cbc65dfe3f418 cfe-7.0.1.src.tar.xz
-sha256 3f3f2e96e3b7319d2b4b49227d6da624a717340107ce2ca5342a25e0e57dfd35 LICENSE.TXT
+sha256 084c115aab0084e63b23eee8c233abb6739c399e29966eaeccfc6e088e0b736b cfe-8.0.0.src.tar.xz
+sha256 bdc41b826a9a50c7a31c1b613ca5d46415be68d5cc6da06f91f5bc1db8ad87aa LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index c15f2b0d2a..6dda8ac2c3 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLANG_VERSION = 7.0.1
+CLANG_VERSION = 8.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
@@ -49,9 +49,9 @@ CLANG_CONF_OPTS += \
 	-DCLANG_INCLUDE_DOCS=OFF \
 	-DCLANG_INCLUDE_TESTS=OFF
 
-HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config \
+HOST_CLANG_CONF_OPTS += -DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
 	-DCLANG_DEFAULT_LINKER=$(TARGET_LD)
-CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
+CLANG_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm \
 	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/bin/clang-tblgen \
 	-DLLVM_TABLEGEN_EXE:FILEPATH=$(HOST_DIR)/bin/llvm-tblgen
 
-- 
2.11.0
