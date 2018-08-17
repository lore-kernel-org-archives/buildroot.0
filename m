From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Aug 2018 12:43:15 +0300
Subject: [Buildroot] [PATCH v2] dahdi-tools: unify dependencies comments
Message-ID: <f00ac4110933271a8d0f4240b8ae257e31a027b7.1534498995.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The threads dependency comment is currently shown even though the
toolchain supports threads, only because kernel build is disabled.

Merge the kernel and threads comments. This is similar to what we have
in other packages that need the kernel.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: merge the two comments
---
 package/dahdi-tools/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/dahdi-tools/Config.in b/package/dahdi-tools/Config.in
index 39042df04134..a5f145dfe8cb 100644
--- a/package/dahdi-tools/Config.in
+++ b/package/dahdi-tools/Config.in
@@ -15,9 +15,5 @@ config BR2_PACKAGE_DAHDI_TOOLS
 
 	  http://www.asterisk.org/downloads/dahdi
 
-# Two comments, otherwise it may not fit in menuconfig for narrow terminals
-comment "dahdi-tools needs a toolchain w/ threads"
+comment "dahdi-tools needs a toolchain w/ threads and a Linux kernel to be built"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LINUX_KERNEL
-
-comment "dahdi-tools needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-- 
2.18.0
