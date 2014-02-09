From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 16:39:20 +0100
Subject: [Buildroot] [git commit] trace-cmd: disable on avr32
Message-ID: <20140209154256.81C529C8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=172a8249d0f75d2538725186054a9da3397976dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AVR32 does not have TLS support.

Fixes:
http://autobuild.buildroot.net/results/e24/e24af3ceb125da50f0f5cbffb0e3ca091c68af33/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
