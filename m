From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 13:08:26 +0200
Subject: [Buildroot] [git commit] libnspr: needs dynamic library support
Message-ID: <20150623110910.13579800D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbe48a059cb88e9ca4ca4466f72be0c07989aefd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only package selecting libnspr (libnss) requires dynamic library already.

Fixes:
http://autobuild.buildroot.net/results/296/296bc0fd888a43700d2ea020f8486932c5d37760/
http://autobuild.buildroot.net/results/a65/a65588aa91a87f9a3d8af2a485de2df3e30cfc19/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 6a5310c..ba1ea55 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -7,6 +7,7 @@ if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
@@ -15,7 +16,7 @@ config BR2_PACKAGE_LIBNSPR
 
 	  http://www.mozilla.org/projects/nspr/
 
-comment "libnspr needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libnspr needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 endif
