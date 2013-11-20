From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Nov 2013 10:43:18 +0100
Subject: [Buildroot] [git commit] lxc: needs largefile support
Message-ID: <20131120104709.BB07D9BD62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1ac80dad83a15171b990e43ef4fc10a51a8772f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lxc_checkpoint.c: In function ???main???:
lxc_checkpoint.c:128: error: ???O_LARGEFILE??? undeclared (first use in this function)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 3afb5b6..d082f7f 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LXC
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
@@ -11,6 +12,6 @@ config BR2_PACKAGE_LXC
 
 	  http://lxc.sourceforge.net/
 
-comment "lxc needs a toolchain w/ IPv6, threads"
+comment "lxc needs a toolchain w/ IPv6, threads, largefile"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
