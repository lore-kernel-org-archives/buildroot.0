From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jun 2012 21:08:56 +0200
Subject: [Buildroot] [git commit] collectd: needs thread support
Message-ID: <20120618191207.E1A8196F69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cf295017d21233806528d6a3538c9724913db8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/28f10dcc772809d53315f6dfb37bb41d77183abe/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index cb96fbd..96438c0 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_COLLECTD
 	bool "collectd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  collectd is a daemon which collects system performance
 	  statistics periodically and provides mechanisms to store
@@ -380,3 +381,6 @@ config BR2_PACKAGE_COLLECTD_WRITEHTTP
 endmenu
 
 endif
+
+comment "collectd needs a toolchain with thread support"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS
