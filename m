From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 23:12:22 +0200
Subject: [Buildroot] [git commit] exfat: doesn't work on static builds
	because of libfuse
Message-ID: <20130414212038.14F759B4E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9199fabd390d5a3858124b9b8f8b9ee1c71ef98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/exfat/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exfat/Config.in b/package/exfat/Config.in
index c7e7fdb..55be23e 100644
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EXFAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
 	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	select BR2_PACKAGE_LIBFUSE
 	help
 	  A full-featured exFAT file system implementation for GNU/Linux
@@ -11,5 +12,5 @@ config BR2_PACKAGE_EXFAT
 
 	  http://code.google.com/p/exfat/
 
-comment "exfat requires a toolchain with LARGEFILE, WCHAR and threads support"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "exfat requires a toolchain with LARGEFILE, WCHAR, threads and dynamic library support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
