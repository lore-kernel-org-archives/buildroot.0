From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 23 Jun 2015 13:47:55 +0300
Subject: [Buildroot] [PATCH] libnspr: needs dynamic library support
Message-ID: <df22a990a925aa18c56cfcee2370d8764312eab3.1435056475.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only package selecting libnspr (libnss) requires dynamic library already.

Fixes:
http://autobuild.buildroot.net/results/296/296bc0fd888a43700d2ea020f8486932c5d37760/
http://autobuild.buildroot.net/results/a65/a65588aa91a87f9a3d8af2a485de2df3e30cfc19/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnspr/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 6a5310c50d06..ba1ea5593321 100644
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
-- 
2.1.4
