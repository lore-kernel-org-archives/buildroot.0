From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:48:25 +0100
Subject: [Buildroot] [git commit] package/tvheadend: requires kernel headers
	>= 3.2
Message-ID: <20140301193723.8E23E96DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35595aee2a8e82f98ca82f083c442a9a004cc573
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tvheadend requires SYS_TURBO, introduced in linux 3.2.

Fixes:
    http://autobuild.buildroot.net/results/4df/4df8cd85e0287910567df81c0394b2914570e98a

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
