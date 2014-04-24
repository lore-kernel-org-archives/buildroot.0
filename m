From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Apr 2014 11:56:19 +0300
Subject: [Buildroot] [PATCH] smack: needs kernel headers v3.0+
Message-ID: <08771bc278220844d434dc32849b6a521644203b.1398329779.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

smack uses symbols that are exported to userspace only since Linux kernel
commit 1dbe39424a43 (xattr.h: expose string defines to userspace).

Fixes:
http://autobuild.buildroot.net/results/7fc/7fc69002fbb37962e65e0f83384ae7a4e6eac8a9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/smack/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/smack/Config.in b/package/smack/Config.in
index 618a6807e175..55e9d2e694c3 100644
--- a/package/smack/Config.in
+++ b/package/smack/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SMACK
 	bool "smack"
 	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  User space programs and libraries for SMACK.
 
@@ -28,5 +29,6 @@ config BR2_PACKAGE_SMACK
 
 	  https://github.com/smack-team/smack
 
-comment "smack needs a toolchain w/ dynamic library"
+comment "smack needs a toolchain w/ dynamic library, headers >= 3.0"
 	depends on BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
1.9.2
