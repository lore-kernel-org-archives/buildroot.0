From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 May 2014 14:56:58 +0200
Subject: [Buildroot] [git commit] tmux: needs mmu
Message-ID: <20140502125931.600849CAA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8dc41442506d84a8b335280312d9652907290d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1b2/1b2a8c75e73ec136e639896f23544bf85906e97b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tmux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
