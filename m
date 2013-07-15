From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:09 -0500
Subject: [Buildroot] [PATCH 26/67] libmms: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-27-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libmms/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmms/Config.in b/package/libmms/Config.in
index 17cb406..3cabbc7 100644
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBMMS
 	bool "libmms"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
           LibMMS is a common library for parsing mms:// and mmsh://
@@ -11,5 +12,5 @@ config BR2_PACKAGE_LIBMMS
 
 	  http://launchpad.net/libmms
 
-comment "libmms requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libmms requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
