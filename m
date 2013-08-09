From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  9 Aug 2013 11:57:28 -0500
Subject: [Buildroot] [PATCH 1/1] udev:
	s/BR2_TOOLCHAIN_USE_THREADS/BR2_TOOLCHAIN_HAS_THREADS/
Message-ID: <1376067448-29970-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug fix.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/udev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index ed32c89..dd5ad7b 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	  libacl, hwdata and libglib2
 
 comment "enabling all extras requires a toolchain with WCHAR and threading support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_USE_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
 
-- 
1.8.1.2
