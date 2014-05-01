From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 May 2014 16:16:20 +0300
Subject: [Buildroot] [PATCH] smack: needs threads
Message-ID: <a9e3d42052ef7b538b2ad9a496b576d9beb392a2.1398950180.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/38a/38a558be589784bcc700a0e83e2e1e14eed66d83/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/smack/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/smack/Config.in b/package/smack/Config.in
index 3f26caecd61f..ffbe73c2af08 100644
--- a/package/smack/Config.in
+++ b/package/smack/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SMACK
 	bool "smack"
 	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  User space programs and libraries for SMACK.
@@ -29,5 +30,6 @@ config BR2_PACKAGE_SMACK
 
 	  https://github.com/smack-team/smack
 
-comment "smack needs a toolchain w/ dynamic library, headers >= 3.0"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+comment "smack needs a toolchain w/ dynamic library, threads, headers >= 3.0"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.2
