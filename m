From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 12:40:02 +0100
Subject: [Buildroot] [git commit] inotify-tools: needs mmu
Message-ID: <20130219114156.DD0809AB88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1eccc01ff8d38a9e4e6e1864ebd66f491c962d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8424451b46d6787fc586502fa5774564e4715ce8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/inotify-tools/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
