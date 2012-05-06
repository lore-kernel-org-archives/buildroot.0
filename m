From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 20:08:53 +0200
Subject: [Buildroot] [git commit] rsync: needs MMU
Message-ID: <20120506180941.BD0258F738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2daf2de6e1a0a8807cd09b2f85dd1c998d022947
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rsync/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rsync/Config.in b/package/rsync/Config.in
index 0f33774..be95a7c 100644
--- a/package/rsync/Config.in
+++ b/package/rsync/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_RSYNC
 	bool "rsync"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  File transfer program to keep remote files in sync.
 
