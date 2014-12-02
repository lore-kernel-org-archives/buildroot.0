From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 13:07:33 +0100
Subject: [Buildroot] [git commit] exiv2: XMP support needs largefile
Message-ID: <20141202145823.6174C80076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=156397e6fbfe1a4cfdca71f954603b68d23049e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XMP code enables largefile unconditionally.

Fixes:
http://autobuild.buildroot.net/results/116/1166068a64733d22a2f891849177ad826347dc9f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 3dc7445..b2e2ac8 100644
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
