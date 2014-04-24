From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Apr 2014 12:27:16 +0300
Subject: [Buildroot] [PATCH] smack: fix dependencies comment
Message-ID: <310a5750548ad302ef39e202768ebb3b3a265eb3.1398331636.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment should show when any of these conditions is not met.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/smack/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/smack/Config.in b/package/smack/Config.in
index 55e9d2e694c3..3f26caecd61f 100644
--- a/package/smack/Config.in
+++ b/package/smack/Config.in
@@ -30,5 +30,4 @@ config BR2_PACKAGE_SMACK
 	  https://github.com/smack-team/smack
 
 comment "smack needs a toolchain w/ dynamic library, headers >= 3.0"
-	depends on BR2_PREFER_STATIC_LIB
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
1.9.2
