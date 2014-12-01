From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 Dec 2014 22:42:06 +0200
Subject: [Buildroot] [PATCH] exiv2: XMP support needs largefile
Message-ID: <bed23382a22ff4672c36ac53805589eaef4399b1.1417466526.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

XMP code enables largefile unconditionally.

Fixes:
http://autobuild.buildroot.net/results/116/1166068a64733d22a2f891849177ad826347dc9f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/exiv2/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 3dc74459a78c..b2e2ac83d095 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -39,11 +39,12 @@ config BR2_PACKAGE_EXIV2_XMP
 	bool "XMP support"
 	select BR2_PACKAGE_EXPAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
 	help
 	  Build with XMP support
 
-comment "xmp support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "xmp support needs a toolchain w/ threads, and largefile"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
 
 config BR2_PACKAGE_EXIV2_LENSDATA
 	bool "Nikon lens name database"
-- 
2.1.3
