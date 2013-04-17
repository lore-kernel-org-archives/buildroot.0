From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 16 Apr 2013 17:39:27 -0700
Subject: [Buildroot] [PATCH] ntfs-3g: needs toolchain with threads support
Message-ID: <1366159167-347-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/ff10a72ac5836749155396e87f0cd32cd89f94c7

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
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
-- 
1.7.4.1
