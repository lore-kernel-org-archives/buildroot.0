From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:05 -0500
Subject: [Buildroot] [PATCH 22/67] latencytop: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-23-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/latencytop/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
index 12176c0..23e4c63 100644
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop"
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -19,5 +20,5 @@ config BR2_PACKAGE_LATENCYTOP
 
 	  http://www.latencytop.org
 
-comment "latencytop requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "latencytop requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
