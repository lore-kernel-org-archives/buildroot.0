From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 14:26:09 +0200
Subject: [Buildroot] [git commit] ntfs-3g: uses dlopen(),
	not available on static builds
Message-ID: <20150604133645.A203081E32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=174b8469029cb8018200516a00a5b890ec7cd1a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/722/7227d5f01755affa2a234eedd8d1fc8c826395c7/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntfs-3g/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 36e8ab8..a860498 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NTFS_3G
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
 	help
 	  The NTFS-3G driver is an open source, freely available
 	  read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
@@ -29,6 +30,6 @@ config BR2_PACKAGE_NTFS_3G_NTFSPROGS
 
 endif
 
-comment "ntfs-3g needs a toolchain w/ wchar, threads"
+comment "ntfs-3g needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS)
