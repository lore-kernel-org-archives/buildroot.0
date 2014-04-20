From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 19:38:37 +0200
Subject: [Buildroot] [git commit] cppcms: does not build on static library
	only, needs dlopen()
Message-ID: <20140420173903.B05EC9C90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9db7e6865e1805e8281136d5f2a6965f6a3b5c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/5ee/5ee69eb7492fbd462124d7a23b5b79003fc1dd64/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppcms/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index bfbb203..688d8f2 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CPPCMS
 	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
@@ -38,5 +39,6 @@ comment "icu support needs a toolchain w/ wchar"
 
 endif
 
-comment "cppcms needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "cppcms needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
