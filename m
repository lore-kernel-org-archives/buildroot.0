From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 4 Dec 2015 17:54:15 +0100
Subject: [Buildroot] [PATCH] directfb: disable for sparc
Message-ID: <20151204165415.GA5835@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Requires atomic operations.
Fixes following autobuild failure:
http://autobuild.buildroot.net/results/8205100c166659c47daff66b1e63edc82eeb7930/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/directfb/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 8c13d30..d9008a4 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DIRECTFB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t issue
+	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
-- 
1.7.10.4
