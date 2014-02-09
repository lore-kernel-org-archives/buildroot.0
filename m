From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 16:40:08 +0100
Subject: [Buildroot] [git commit] trace-cmd: needs mmu
Message-ID: <20140209154256.8BCC89C74D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ba4e3b2fa7f24b4a6285086cba02a89bc29fb81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0b7/0b73c684b3d7edcd818cb113fda534e552028d58/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
