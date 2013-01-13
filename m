From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Jan 2013 08:25:15 -0300
Subject: [Buildroot] [PATCH] hiawatha: needs threads
Message-ID: <1358076315-25117-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/9bb3bdb9de43fc6bab119674885df2a28e5559ee/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index ac0aa10..fbed1bc 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,7 +1,11 @@
+comment "hiawatha requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_HIAWATHA
 	bool "hiawatha"
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Hiawatha is a webserver for Unix and has been built with
 	  security in mind. This resulted in a highly secure
-- 
1.7.12.4
