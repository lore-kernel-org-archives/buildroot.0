From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:49 -0500
Subject: [Buildroot] [PATCH 06/67] curlftpfs: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-7-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/curlftpfs/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index 0d8e715..ac527da 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_CURLFTPFS
 	select BR2_PACKAGE_LIBCURL
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, glib2
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
@@ -17,5 +17,5 @@ config BR2_PACKAGE_CURLFTPFS
 
 	  http://curlftpfs.sourceforge.net/
 
-comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR, threads and dynamic library support"
+comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR, threading and dynamic library support"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
-- 
1.8.1.2
