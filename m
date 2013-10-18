From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Oct 2013 16:45:15 -0300
Subject: [Buildroot] [PATCH] lxc: needs mmu
Message-ID: <1382125515-10894-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/602/60289dae59650847e6d32c7ab3be7973a86a25c7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lxc/Config.in | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.8.1.5
