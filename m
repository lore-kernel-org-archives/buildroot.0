From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Sep 2014 10:37:39 +0200
Subject: [Buildroot] [git commit] cppcms: needs wchar support even without
	icu
Message-ID: <20140901085539.9DB4F9D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8993ebb34823b301ea2bf4f1f57495ec29b906b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/6f8/6f8e8b68235f6cf0dfef13e3ed11f97a3ab50a06/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppcms/Config.in |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index dbe4786..460c875 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -32,13 +32,8 @@ config BR2_PACKAGE_CPPCMS_ICU
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ wchar"
-	depends on !BR2_BINFMT_FLAT
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_USE_WCHAR
-
 endif
 
-comment "cppcms needs a toolchain w/ C++, NPTL, dynamic library"
+comment "cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_PREFER_STATIC_LIB
+		!BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
