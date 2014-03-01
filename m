From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 15:53:07 +0100
Subject: [Buildroot] [PATCH 12/13] package/tvheadend: requires kernel
	headers >= 3.2
In-Reply-To: <cover.1393685422.git.yann.morin.1998@free.fr>
References: <cover.1393685422.git.yann.morin.1998@free.fr>
Message-ID: <8a812d7fdca91d5514ba0e84f44529b08948f3f6.1393685422.git.yann.morin.1998@free.fr>
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
index 74df825..a5bbeee 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,10 +1,11 @@
-comment "tvheadend needs a toolchain w/ largefile, IPv6, NPTL"
-	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "tvheadend needs a toolchain w/ largefile, IPv6, NPTL, headers >= 3.2"
+	depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on BR2_LARGEFILE && BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	# tvheadend requires an atomic_add operation. Either you have
 	# a gcc >= 4.3 toolchain and it uses the gcc intrinsics, or it
 	# has special code for x86, x86-64, PPC and ARM. So in the
-- 
1.8.3.2
