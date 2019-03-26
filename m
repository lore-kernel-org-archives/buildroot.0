From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 20:17:42 +0100
Subject: [Buildroot] [git commit] package/gcc: select
 BR2_TOOLCHAIN_HAS_OPENMP if BR2_GCC_ENABLE_OPENMP
Message-ID: <20190326191521.D35A081520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d586541bd85a14229f3ac943974d53571b90a2e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TOOLCHAIN_HAS_OPENMP is also selected by external toolchains, so
can be used by packages to determine OpenMP support.

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 222251f43c..8e22a4c155 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -127,6 +127,7 @@ config BR2_GCC_ENABLE_LTO
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
 	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Enable OpenMP support for the compiler
 
