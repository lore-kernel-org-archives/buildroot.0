From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 14:17:53 +0200
Subject: [Buildroot] [git commit] package/makedevs: fixing missing return
	type
Message-ID: <20150413121758.E16B28078E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3b8056960024151b07fc3e3fa1d12d15ee979ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes a missing return type in bb_recursive function.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/makedevs/makedevs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index ee0f9fb..53ff6fe 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -369,7 +369,7 @@ void bb_show_usage(void)
 	exit(1);
 }
 
-bb_recursive(const char *fpath, const struct stat *sb,
+int bb_recursive(const char *fpath, const struct stat *sb,
 		int tflag, struct FTW *ftwbuf){
 
 	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
