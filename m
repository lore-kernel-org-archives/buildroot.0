From: Julian Lunz <git@jlunz.de>
Date: Sun,  8 Apr 2012 12:32:51 +0200
Subject: [Buildroot] [PATCH] Fix makedevs to allow longer path names
Message-ID: <1333881171-3707-1-git-send-email-git@jlunz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makedevs path name is currently limited to 40, changed it to
PATH_MAX 4096 from linux/include/linux/limits.h
Signed-off-by: Julian Lunz <git@jlunz.de>
---
 package/makedevs/makedevs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 5d5668d..ab90b93 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -410,7 +410,7 @@ int main(int argc, char **argv)
 		unsigned int count = 0;
 		unsigned int increment = 0;
 		unsigned int start = 0;
-		char name[41];
+		char name[4096];
 		char user[41];
 		char group[41];
 		char *full_name;
@@ -419,7 +419,7 @@ int main(int argc, char **argv)
 
 		linenum++;
 
-		if ((2 > sscanf(line, "%40s %c %o %40s %40s %u %u %u %u %u", name,
+		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
 						&type, &mode, user, group, &major,
 						&minor, &start, &increment, &count)) ||
 				((major | minor | start | count | increment) > 0xfffff))
-- 
1.7.2.5
