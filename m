From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Tue, 23 Dec 2008 17:51:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20081223175138.607E576A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-12-23 17:51:37 +0000 (Tue, 23 Dec 2008)
New Revision: 24529

Log:
scripts/setlocalversion: update deprecated git-<command> usage

Git is moving away from the git-<command> to git <command>

git-svn -> git svn

Modified:
   trunk/buildroot/scripts/setlocalversion


Changeset:
Modified: trunk/buildroot/scripts/setlocalversion
===================================================================
--- trunk/buildroot/scripts/setlocalversion	2008-12-23 14:54:49 UTC (rev 24528)
+++ trunk/buildroot/scripts/setlocalversion	2008-12-23 17:51:37 UTC (rev 24529)
@@ -17,7 +17,7 @@
 
 	# Is this git on svn?
 	if git config --get svn-remote.svn.url >/dev/null; then
-	        printf -- '-svn%s' "`git-svn find-rev $head`"
+	        printf -- '-svn%s' "`git svn find-rev $head`"
 	fi
 
 	# Are there uncommitted changes?
