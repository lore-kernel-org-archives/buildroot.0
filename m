From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Aug 2018 12:05:20 +0300
Subject: [Buildroot] [PATCH] dahdi-tools: fix dependencies comment condition
Message-ID: <bcc4fba3f0a19c97f2361a8924defc43716966cc.1534496720.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The threads dependency comment is unrelated to the Linux kernel
dependency.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dahdi-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dahdi-tools/Config.in b/package/dahdi-tools/Config.in
index 39042df04134..625d17f216e3 100644
--- a/package/dahdi-tools/Config.in
+++ b/package/dahdi-tools/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_DAHDI_TOOLS
 
 # Two comments, otherwise it may not fit in menuconfig for narrow terminals
 comment "dahdi-tools needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "dahdi-tools needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
-- 
2.18.0
