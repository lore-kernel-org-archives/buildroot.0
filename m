From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2019 09:59:19 +0100
Subject: [Buildroot] [PATCH] package/lrzip: needs C++
Message-ID: <20191216085920.30717-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e40/e40653aa895bb47d20ad237c8a5ae3f6b76f3f67/

libzpaq is written in C++ (and unconditionally built), so depend on C++
support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzip/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lrzip/Config.in b/package/lrzip/Config.in
index 92540a5036..885b84dbb0 100644
--- a/package/lrzip/Config.in
+++ b/package/lrzip/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LRZIP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_BZIP2
@@ -17,6 +18,7 @@ config BR2_PACKAGE_LRZIP
 
 	  https://github.com/ckolivas/lrzip
 
-comment "lrzip needs a toolchain w/ wchar, threads"
+comment "lrzip needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.20.1
