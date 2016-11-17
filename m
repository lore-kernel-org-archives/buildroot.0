From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 17 Nov 2016 10:18:29 +0200
Subject: [Buildroot] [PATCH] canfestival: comment on musl disable
Message-ID: <dae10b62748408881f5c3dbe970d8bf428089e71.1479370709.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on commit 4d00a4058b9e5 (can-festival: disable on musl) and a previous
fix attempt[1], add a comment explaining why build with musl is disabled.

[1] http://patchwork.ozlabs.org/patch/509731/

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/canfestival/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index 5522afe54f03..ca949565f5a0 100644
--- a/package/canfestival/Config.in
+++ b/package/canfestival/Config.in
@@ -11,7 +11,7 @@ comment "canfestival needs a glibc or uClibc toolchain w/ threads and dynamic li
 config BR2_PACKAGE_CANFESTIVAL
 	bool "canfestival"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
-- 
2.10.2
