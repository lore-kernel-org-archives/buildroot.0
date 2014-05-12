From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 23:10:35 +0200
Subject: [Buildroot] [PATCH] toolchain-external: Sourcery CodeBench ARM
	2013.05 affected by PR58595
Message-ID: <1399929035-10908-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/6b3/6b342c2d101348e4d39285f45481e2aafa3d8b3f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2bc5d4d..857f26d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -138,6 +138,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.7.3
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-- 
1.9.2
