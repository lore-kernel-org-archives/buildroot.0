From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 May 2014 08:09:22 -0300
Subject: [Buildroot] [PATCH] tmux: needs mmu
Message-ID: <1399028962-21069-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1b2/1b2a8c75e73ec136e639896f23544bf85906e97b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tmux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tmux/Config.in b/package/tmux/Config.in
index 831d119..fa8f64a 100644
--- a/package/tmux/Config.in
+++ b/package/tmux/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TMUX
 	bool "tmux"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_NCURSES
 	help
-- 
1.8.3.2
