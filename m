From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 10:20:17 +0200
Subject: [Buildroot] [PATCH] collectd: needs thread support
Message-ID: <1340007618-7387-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/28f10dcc772809d53315f6dfb37bb41d77183abe/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.7.9.5
