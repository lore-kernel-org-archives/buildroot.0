From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  9 Feb 2014 14:04:27 +0100
Subject: [Buildroot] [PATCH 1/1] trace-cmd: needs mmu
Message-ID: <1391951067-17304-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/0b7/0b73c684b3d7edcd818cb113fda534e552028d58/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/trace-cmd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index d48e0fd..9d454e4 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TRACE_CMD
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_avr32 # AVR32 does not have TLS support
+	depends on BR2_USE_MMU # fork()
 	help
 	  Command line reader for ftrace.
 
-- 
1.8.5.3
