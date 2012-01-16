From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Jan 2012 13:54:57 +0100
Subject: [Buildroot] [git commit] setlocalversion: fix i18n issue with svn
Message-ID: <20120116125801.732F29035A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4861aed1f1fccd20bf092127b255562eaaf183c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4700

Signed-off-by: Frederik Pasch <fpasch@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    1 +
 support/scripts/setlocalversion |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8f6870b..19f6e7c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -38,6 +38,7 @@
 	#3403: libgpg-error: bump to version 1.10
 	#3409: libgpg-error: download from gnupg.org
 	#3421: nano: make tiny flag optional
+	#4700: setlocalversion not working for combination svn/ubuntu 11.10...
 
 2011.11, Released November 30th, 2011:
 
diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion
index 8d6fe90..a6edd71 100755
--- a/support/scripts/setlocalversion
+++ b/support/scripts/setlocalversion
@@ -56,9 +56,9 @@ if hgid=`hg id 2>/dev/null`; then
 fi
 
 # Check for svn and a svn repo.
-if rev=`LANG=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
+if rev=`LC_ALL=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
 	rev=`echo $rev | awk '{print $NF}'`
-	changes=`LANG=C svn status 2>/dev/null | grep '^[AMD]' | wc -l`
+	changes=`LC_ALL=C svn status 2>/dev/null | grep '^[AMD]' | wc -l`
 
 	# Are there uncommitted changes?
 	if [ $changes != 0 ]; then
