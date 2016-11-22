From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 10:41:06 +0100
Subject: [Buildroot] [git commit branch/next] canfestival: comment on musl
	disable
Message-ID: <20161122094110.4D2B081D80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee5d4b72b9ea0f5f446acd579cfa2f0cb1311378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Based on commit 4d00a4058b9e5 (can-festival: disable on musl) and a previous
fix attempt[1], add a comment explaining why build with musl is disabled.

[1] http://patchwork.ozlabs.org/patch/509731/

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/canfestival/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index 5522afe..ca94956 100644
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
