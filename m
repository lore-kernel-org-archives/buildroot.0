From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Feb 2013 07:15:25 -0300
Subject: [Buildroot] [PATCH] inotify-tools: needs mmu
Message-ID: <1361268925-16980-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8424451b46d6787fc586502fa5774564e4715ce8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inotify-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
index ed94b3f..0a8c7c9 100644
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_INOTIFY_TOOLS
 	bool "inotify-tools"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  inotify-tools is a C library and a set of command-line
 	  programs for Linux providing a simple interface to inotify.
-- 
1.7.12.4
