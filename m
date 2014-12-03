From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 21:39:25 +0100
Subject: [Buildroot] [git commit] package/lxc: disable broken toolchains on
	nios2
Message-ID: <20141203222237.8FC307FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a340b21300c0c59e68eec652e205473525d127f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed with Thomas
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100998
only the current toolchains are broken:
"it's better to blacklist the individual toolchains that are known
to be broken, so that if we add another toolchain, we will be able
to see if the same bug happens as well or not."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index cf85712..a90e58e 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -6,7 +6,9 @@ config BR2_PACKAGE_LXC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_avr32 # no timerfd
-	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
+	# the toolchain doesn't support setns syscall
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
@@ -18,6 +20,7 @@ config BR2_PACKAGE_LXC
 comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # no timerfd
-	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS \
                 || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
