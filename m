From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 13 Jul 2015 15:38:27 -0500
Subject: [Buildroot] [PATCH v2 1/1] ntfs-3g: fix incorrect comment dependency
Message-ID: <1436819907-54890-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment for ntfs-3g displays even when the package has met its
necessary dependencies.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/ntfs-3g/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index a860498..d6d1481 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -32,4 +32,4 @@ endif
 
 comment "ntfs-3g needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS)
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
1.9.1
