From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu,  1 Sep 2016 16:44:29 -0300
Subject: [Buildroot] [PATCH] supertuxkart: Constrain to x86 architecture
Message-ID: <20160901194429.11761-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our build system has detected that angelscript can't be
cross-compiled properly. This has been also reported to
supertuxkart [1], and although the developers were open
to take patches fixing STK embedded angelscript, it was
pointed out that non-x86 architectures were not officially
supported and of little interest [2].

Hence, let's constrain the package selection to x86.

[1] https://github.com/supertuxkart/stk-code/issues/2569
[2] https://github.com/supertuxkart/stk-code/pull/2195

Fixes: http://autobuild.buildroot.net/results/655/655f046b3bb5f7a4ea492328b608e409d6769689/
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/supertuxkart/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index a1f7074eb78f..9a8eabe2b611 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SUPERTUXKART
 	bool "supertuxkart"
+	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
@@ -25,6 +26,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	  http://supertuxkart.sourceforge.net/Main_Page
 
 comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++"
+	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
-- 
2.9.3
