From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 14:34:11 +0100
Subject: [Buildroot] [PATCH] lxc: update comment about the headers >= 3.0
	dependency
Message-ID: <1458221651-4573-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 604095fe9bea925f34ea05a5d80efbc3e9ba16f2 ("libcap: add
patch to fix build issue with old kernel headers"), libcap builds fine
with headers < 3.0, so it is no longer the reason why lxc needs
headers >= 3.0.

However, lxc uses setns(), which is only available since kernel 3.0,
so we simply update the comment next to the dependency so that it is
accurate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 3253f14..6a39d2e 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LXC
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # setns() system call
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
-- 
2.6.4
