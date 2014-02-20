From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 23:14:26 +0100
Subject: [Buildroot] [PATCH] gdb: cross-gdb has no support for NIOS 2
Message-ID: <1392934466-28160-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/df0/df09e1fe301480b599be777bf26874d66a152810//

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9c77028..8936dcb 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -4,7 +4,7 @@ config BR2_PACKAGE_HOST_GDB
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_aarch64
+	depends on !BR2_aarch64 && !BR2_nios2
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
-- 
1.8.3.2
