From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 19:11:38 +0100
Subject: [Buildroot] [git commit] package/lxc: enable for CodeSourcery nios2
	2015.11 toolchain
Message-ID: <20160305181217.33E177FB22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e3a134e8604c789f9c187e78bc861078c77a25b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CS nios2 2015.11 is based on kernel header 4.2 which must now
provide the setns syscall for nios2.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
