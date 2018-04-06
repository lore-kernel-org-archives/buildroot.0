From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri,  6 Apr 2018 11:39:58 +0200
Subject: [Buildroot] [PATCH] package/llvm: add dependency on shared libraries
Message-ID: <20180406093958.9392-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

llvm generates libLLVM.so, so it won't work if BR2_STATIC_LIBS is set

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/llvm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 70f73f4858..d507acbef1 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_LLVM
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	help
 	  The LLVM Project is a collection of modular and reusable
 	  compiler and toolchain technologies.
-- 
2.14.3
