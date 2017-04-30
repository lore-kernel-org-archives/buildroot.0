From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 30 Apr 2017 10:41:20 +0200
Subject: [Buildroot] [PATCH] ifupdown: wordexp is enabled in uClibc now
Message-ID: <20170430084120.GA17431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package can now be used for uClibc toolchains.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ifupdown/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
index e683201..ccacd0f 100644
--- a/package/ifupdown/Config.in
+++ b/package/ifupdown/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_IFUPDOWN
 	bool "ifupdown"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
-	# Default/our uclibc lacks wordexp()
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	# runtime for ip binary
 	select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
@@ -14,8 +12,7 @@ config BR2_PACKAGE_IFUPDOWN
 
 	  https://tracker.debian.org/pkg/ifupdown
 
-comment "ifupdown needs a glibc or musl toolchain w/ headers >= 3.0"
+comment "ifupdown needs a toolchain w/ headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
2.1.4
