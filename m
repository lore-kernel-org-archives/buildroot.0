From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 13:37:24 +0100
Subject: [Buildroot] [git commit] package/opentracing-cpp: needs threads
Message-ID: <20190204123745.7C6F7814D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c78b8ee8f4e4604c3adc53dab5a25b63136a0e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opentracing-cpp uses std::mutex since 1.3.0.

Fixes: http://autobuild.buildroot.net/results/121a9f2aacf9e7b1f5d0b3f2c55bc1da36c7cfb6/

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opentracing-cpp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
index 4ee7b29de2..ebcce35aa8 100644
--- a/package/opentracing-cpp/Config.in
+++ b/package/opentracing-cpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENTRACING_CPP
 	bool "opentracing-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	help
@@ -8,8 +9,8 @@ config BR2_PACKAGE_OPENTRACING_CPP
 
 	  http://opentracing.io
 
-comment "opentracing-cpp needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "opentracing-cpp needs a toolchain w/ C++, threads, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "opentracing-cpp needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
