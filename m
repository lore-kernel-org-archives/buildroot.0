From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:18 -0500
Subject: [Buildroot] [PATCH 35/67] nbd: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-36-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minor cleanup as well

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/nbd/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 79b34de..d185a48 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NBD
 	bool "nbd"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
@@ -8,9 +9,6 @@ config BR2_PACKAGE_NBD
 
 	  http://nbd.sf.net/
 
-comment "nbd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
-
 if BR2_PACKAGE_NBD
 
 config BR2_NBD_CLIENT
@@ -25,3 +23,8 @@ config BR2_NBD_SERVER
 	  the server part of NBD.
 
 endif
+
+comment "nbd requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+
-- 
1.8.1.2
