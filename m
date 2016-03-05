From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Mar 2016 17:04:21 +0100
Subject: [Buildroot] [PATCH 3/3] package/lxc: enable for CodeSourcery nios2
	2015.11 toolchain
In-Reply-To: <1457193861-23828-1-git-send-email-romain.naour@gmail.com>
References: <1457193861-23828-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1457193861-23828-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CS nios2 2015.11 is based on kernel header 4.2 which must now
provide the setns syscall for nios2.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Build tested only.
---
 package/lxc/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index a5df3e3..3253f14 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_LXC
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
-	# the toolchain doesn't support setns syscall
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
@@ -17,7 +15,6 @@ config BR2_PACKAGE_LXC
 
 comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| BR2_STATIC_LIBS
-- 
2.5.0
