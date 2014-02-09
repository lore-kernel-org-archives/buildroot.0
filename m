From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  9 Feb 2014 11:46:55 +0100
Subject: [Buildroot] [PATCH 1/1] trace-cmd: disable on avr32
Message-ID: <1391942815-18920-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AVR32 does not have TLS support.

Fixes:
http://autobuild.buildroot.net/results/e24/e24af3ceb125da50f0f5cbffb0e3ca091c68af33/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/trace-cmd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 949abce..d48e0fd 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TRACE_CMD
 	bool "trace-cmd"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32 # AVR32 does not have TLS support
 	help
 	  Command line reader for ftrace.
 
-- 
1.8.5.3
