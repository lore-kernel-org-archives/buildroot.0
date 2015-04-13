From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Apr 2015 08:32:21 +0200
Subject: [Buildroot] [PATCH] package/makedevs: fixing missing return type
Message-ID: <1428906741-12906-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes a missing return type in bb_recursive function.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/makedevs/makedevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
