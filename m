From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Nov 2013 11:46:35 +0100
Subject: [Buildroot] [git commit] lxc: needs timerfd, disable on avr32
Message-ID: <20131120104709.C362790BDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4b78bda4b48db846b708657c8ee8310a4960a2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/79a/79ad9d7f5a9fb48e7d3210f0aee14638fde8f3e7/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index d082f7f..39cd577 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LXC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_avr32 # no timerfd
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
@@ -14,4 +15,5 @@ config BR2_PACKAGE_LXC
 
 comment "lxc needs a toolchain w/ IPv6, threads, largefile"
 	depends on BR2_USE_MMU
+	depends on !BR2_avr32 # no timerfd
 	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
