From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 18:27:28 +0100
Subject: [Buildroot] [PATCH 09/10] package/tvheadend: requires kernel
	headers >= 3.2
In-Reply-To: <cover.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <875c6d6da61061d98ebc961f64c94a0174d70ba2.1392571021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

tvheadend requires SYS_TURBO, introduced in linux 3.2.

Fixes:
    http://autobuild.buildroot.net/results/4df/4df8cd85e0287910567df81c0394b2914570e98a

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index da60f83..4f8baae 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,7 +1,7 @@
-comment "tvheadend needs a toolchain w/ largefile, IPv6, threads"
+comment "tvheadend needs a toolchain w/ largefile, IPv6, threads, headers >= 3.2"
 	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
 	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
-	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
@@ -17,6 +17,7 @@ config BR2_PACKAGE_TVHEADEND
 	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
 	# no NPTL for these archs
 	depends on !BR2_xtensa && !BR2_arc
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	select BR2_PACKAGE_DVB_APPS
 	select BR2_PACKAGE_OPENSSL
 	help
-- 
1.8.1.2
