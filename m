From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 20:30:51 +0100
Subject: [Buildroot] [git commit] lxc: needs setns system call,
	disable on nios2
Message-ID: <20140212193505.CAD919C960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1358a2e8024aa62566d17465ee7e8fc0e6c4aaa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f59/f592a011321429426be81bd1ecf664ad9a2c0161/

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
