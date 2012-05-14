From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 May 2012 09:50:57 +0200
Subject: [Buildroot] [PATCH 2/2] gdb: not available on avr32
In-Reply-To: <1336981857-4221-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1336981857-4221-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1336981857-4221-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/1c6cfa7f069e2b7d8a7dacf76fbf95b7909fb37a/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index c9c54b8..fd6956b 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GDB
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_sh && !BR2_sh64
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32
 	help
 	    Build the full gdb debugger to run on the target.
 
-- 
1.7.9.5
