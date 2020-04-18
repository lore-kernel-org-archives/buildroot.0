From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Apr 2020 00:59:03 +0200
Subject: [Buildroot] [PATCH v1 3/6] package/qt5tools: drop all legacy gcc
 requierements below 5.0
In-Reply-To: <20200418225906.17514-1-ps.report@gmx.net>
References: <20200418225906.17514-1-ps.report@gmx.net>
Message-ID: <20200418225906.17514-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As qt5 requires as minimum gcc 5.0 drop all legacy requierements below.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5tools/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 60106c1ee3..f01b51d2e8 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
 	# currently supported in Buildroot, unless the target is
 	# already supported by llvm.
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm, clang
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # llvm, clang
 	depends on BR2_TOOLCHAIN_HAS_THREADS # llvm, clang
 	depends on BR2_INSTALL_LIBSTDCPP # llvm, clang
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # llvm, clang
-- 
2.26.0
