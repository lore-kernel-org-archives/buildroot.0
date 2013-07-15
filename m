From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:10 -0500
Subject: [Buildroot] [PATCH 27/67] libmpd: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-28-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libmpd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
index 9259c19..7617e88 100644
--- a/package/libmpd/Config.in
+++ b/package/libmpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_LIBMPD
 
 	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
 
-comment "libmpd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libmpd requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
