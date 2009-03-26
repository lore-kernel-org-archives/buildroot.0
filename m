From: Michael Roth <mroth@nessie.de>
Date: Thu, 26 Mar 2009 21:21:38 +0100
Subject: [Buildroot] [PATCH] scripts/setlocalversion: Renamed 'git-svn' to
	'git svn'
Message-ID: <1238098898-5749-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 scripts/setlocalversion |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index f6946cf..cc2c128 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -21,7 +21,7 @@ if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 
 	# Is this git on svn?
 	if git config --get svn-remote.svn.url >/dev/null; then
-	        printf -- '-svn%s' "`git-svn find-rev $head`"
+	        printf -- '-svn%s' "`git svn find-rev $head`"
 	fi
 
 	# Are there uncommitted changes?
-- 
1.6.0.6
