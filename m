From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon,  3 Jun 2013 23:41:05 -0700
Subject: [Buildroot] [PATCH] monit: needs threads support in toolchain
Message-ID: <1370328065-16275-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/0b5/0b5838f3d11b45244f27bd2bcb092dd6a88fd39d

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/monit/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/monit/Config.in b/package/monit/Config.in
index 6933aaf..3127da9 100644
--- a/package/monit/Config.in
+++ b/package/monit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MONIT
 	bool "monit"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Monit is a free open source utility for managing and
 	  monitoring, processes, programs, files, directories and
@@ -8,3 +9,6 @@ config BR2_PACKAGE_MONIT
 	  actions in error situations.
 
 	  http://mmonit.com/monit/
+
+comment "monit requires a toolchain with threads support"
+       depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.10.4
