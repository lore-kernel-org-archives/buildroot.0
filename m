From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Apr 2016 08:52:06 +0300
Subject: [Buildroot] [PATCH] lirc-tools: needs a C++ toolchain
Message-ID: <dbda726496d63c8f0f64d68690ad855bb96dbebf.1460440326.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NEWS file record for version 0.9.3:

  * The compiler has been switched to c++, and filenames are
	updated to *.cpp (#79)

Fixes:
http://autobuild.buildroot.net/results/63b/63b1e427df1d6f264517a028655ac80d8d289254/
http://autobuild.buildroot.net/results/340/3409a4af78c83ea354d861052521f634347cd69a/
http://autobuild.buildroot.net/results/88a/88a117c229286ed739bd0ef832fa01a99825286a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lirc-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
index 3bee0949cae1..3dd202f284ed 100644
--- a/package/lirc-tools/Config.in
+++ b/package/lirc-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 	bool "lirc-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_USES_MUSL # GLOB_BRACE
 	# dlopen()
 	depends on !BR2_STATIC_LIBS
@@ -18,7 +19,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 
 	  http://www.lirc.org/
 
-comment "lirc-tools needs a uClibc or (e)glibc toolchain w/ threads, dynamic library"
+comment "lirc-tools needs a uClibc or (e)glibc toolchain w/ threads, dynamic library, C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+		|| !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_MUSL
-- 
2.8.0.rc3
