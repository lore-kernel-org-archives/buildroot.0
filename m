From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 00:00:53 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "blktrace: disable on PowerPC"
In-Reply-To: <1470866453-16903-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470866453-16903-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470866453-16903-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 0d8158fc619ce849b531d07b27da4ba9748d4ea4. Thanks to
a fix in libaio, blktrace now builds fine on PowerPC, so there's no
reason to disable it anymore.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blktrace/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index 1b8212d..c17de80 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_BLKTRACE
 	# Uses posix_spawn()
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
-	# issue: hidden symbol `_rest32gpr_30_x` is referenced by DSO
-	depends on !BR2_powerpc
 	select BR2_PACKAGE_LIBAIO
 	help
 	  blktrace is a block layer IO tracing mechanism which provides
@@ -15,5 +13,4 @@ config BR2_PACKAGE_BLKTRACE
 
 comment "blktrace needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
-	depends on !BR2_powerpc
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-- 
2.7.4
