From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 16 Jul 2016 15:09:21 -0400
Subject: [Buildroot] [PATCH 1/1] package/ti-sgx-um: fix syntax error in
	Config.in
Message-ID: <1468696161-7287-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes a small syntax error in Config.in that stops buildroot from
parsing the Config file.  The error is as follows:

package/ti-sgx-um/Config.in:6: syntax error
package/ti-sgx-um/Config.in:5: invalid option
package/ti-sgx-um/Config.in:6: unknown option "BR2_TOOLCHAIN_HAS_THREADS"

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/ti-sgx-um/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 2be6c06..8e1e4fb 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -2,8 +2,7 @@ comment "ti-sgx-um needs the ti-sgx-km driver"
 	depends on !BR2_PACKAGE_TI_SGX_KM
 
 comment "ti-sgx-um needs a glibc toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC ||
-		!BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TI_SGX_UM
 	bool "ti-sgx-um"
-- 
2.7.4
