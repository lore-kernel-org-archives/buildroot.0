From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 16 Jul 2016 14:31:14 -0300
Subject: [Buildroot] [PATCH] ti-sgx-um: fix missing line continuation
Message-ID: <1468690274-22919-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's missing for the threads conditional, which otherwise results in:
package/ti-sgx-um/Config.in:6: syntax error
package/ti-sgx-um/Config.in:5: invalid option
package/ti-sgx-um/Config.in:6: unknown option
"BR2_TOOLCHAIN_HAS_THREADS"

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ti-sgx-um/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 2be6c06..c73df37 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -2,7 +2,7 @@ comment "ti-sgx-um needs the ti-sgx-km driver"
 	depends on !BR2_PACKAGE_TI_SGX_KM
 
 comment "ti-sgx-um needs a glibc toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC ||
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TI_SGX_UM
-- 
2.7.3
