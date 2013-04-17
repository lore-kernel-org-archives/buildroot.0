From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 21:45:08 +0200
Subject: [Buildroot] [git commit] ntfs-3g: needs toolchain with threads
	support
Message-ID: <20130417195408.46A749B71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a35e3693c8f10ed201da34aa028d0a3a1f193c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/ff10a72ac5836749155396e87f0cd32cd89f94c7

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntfs-3g/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index be19a57..10db8a3 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NTFS_3G
 	bool "ntfs-3g"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	help
 	  The NTFS-3G driver is an open source, freely available
@@ -29,5 +30,5 @@ config BR2_PACKAGE_NTFS_3G_NTFSPROGS
 
 endif
 
-comment "ntfs-3g requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "ntfs-3g requires a toolchain with LARGEFILE, WCHAR and threads support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
