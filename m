From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  8 May 2017 08:30:35 +0300
Subject: [Buildroot] [PATCH] xfsprogs: note musl incompatibility reason
Message-ID: <1e5b6f3ecec825df5e4adfc40d3f6d780f724cbe.1494221435.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/xfsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 9f0d2509c0d6..fb603ad4b985 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -5,7 +5,7 @@ comment "xfsprogs needs a glibc or uClibc toolchain w/ threads"
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_MUSL # missing __[u]int*_t
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-- 
2.11.0
