From: Ed Blake <ed.blake@sondrel.com>
Date: Tue, 26 Mar 2019 12:30:45 +0000
Subject: [Buildroot] [PATCH v2 2/4] package/gcc: select
 BR2_TOOLCHAIN_HAS_OPENMP if BR2_GCC_ENABLE_OPENMP
In-Reply-To: <20190326123032.9905-1-ed.blake@sondrel.com>
References: <20190326123032.9905-1-ed.blake@sondrel.com>
Message-ID: <20190326123032.9905-3-ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_TOOLCHAIN_HAS_OPENMP is also selected by external toolchains, so
can be used by packages to determine OpenMP support.

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8ec406a117..f5496bfbbc 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -129,6 +129,7 @@ config BR2_GCC_ENABLE_LTO
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
 	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Enable OpenMP support for the compiler
 
-- 
2.17.1
