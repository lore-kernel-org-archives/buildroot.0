From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Fri, 14 Feb 2014 13:09:20 +0100
Subject: [Buildroot] [PATCH 1/1] build with GCC 4.8
Message-ID: <1392379760-18464-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 package/ti-gfx/ti-gfx-newclkapi.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-newclkapi.patch
index 8f50c7e..29ad20d 100644
--- a/package/ti-gfx/ti-gfx-newclkapi.patch
+++ b/package/ti-gfx/ti-gfx-newclkapi.patch
@@ -14,7 +14,7 @@ Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
 +#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
 +int clk_disable_unprepare(struct clk *clk)
 +{
-+	return clk_disable(clk);
++	clk_disable(clk); return 0;
 +}
 +#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
 +int clk_disable_unprepare(struct clk *clk)
@@ -35,7 +35,7 @@ Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
 +#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
 +int clk_prepare_enable(struct clk *clk)
 +{
-+	return clk_enable(clk);
++	clk_enable(clk); return 0;
 +}
 +#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
 +int clk_prepare_enable(struct clk *clk)
-- 
1.8.3.2
