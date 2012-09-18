From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Sep 2012 21:30:22 +0200
Subject: [Buildroot] [git commit] libnspr: requires thread support in
	toolchain
Message-ID: <20120918193150.8365299697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0767d84b06e1856191f6483b3e163796e99257e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

 http://autobuild.buildroot.org/results/58e0784e2289a60fa51589d2ce0a7a8ffe40f07e/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/Config.in |    5 +++--
 package/libnss/Config.in  |    6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 53086f0..f4f24d4 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBNSPR
 	bool "libnspr"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  NSPR is the Netscape Portable Runtime library which provides
 	  a platform-neutral API for system level and libc like
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LIBNSPR
 
 	  http://www.mozilla.org/projects/nspr/
 
-comment "libnspr requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "libnspr requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE && !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 55928a4..a070ffb 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
@@ -13,5 +14,6 @@ config BR2_PACKAGE_LIBNSS
 
 	  http://www.mozilla.org/projects/security/pki/nss/
 
-comment "libnss requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "libnss requires a toolchain with LARGEFILE and thread support"
+	depends on !BR2_LARGEFILE && !BR2_TOOLCHAIN_HAS_THREADS
+
