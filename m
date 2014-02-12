From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 12 Feb 2014 15:28:29 -0300
Subject: [Buildroot] [PATCH] lxc: needs setns system call, disable on nios2
Message-ID: <1392229709-3915-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/f59/f592a011321429426be81bd1ecf664ad9a2c0161/

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/lxc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 39cd577..d0937e6 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LXC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_avr32 # no timerfd
+	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
@@ -16,4 +17,5 @@ config BR2_PACKAGE_LXC
 comment "lxc needs a toolchain w/ IPv6, threads, largefile"
 	depends on BR2_USE_MMU
 	depends on !BR2_avr32 # no timerfd
+	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
-- 
1.8.1.5
