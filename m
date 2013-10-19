From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Oct 2013 23:17:14 +0200
Subject: [Buildroot] [git commit] lxc: needs mmu
Message-ID: <20131019212051.4CD979BA69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98ab2cb15daedc633f0ddc89dc9a29f14d23c911
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/602/60289dae59650847e6d32c7ab3be7973a86a25c7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index ad463b1..f8c1fb9 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LXC
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
