From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 20:47:39 +0000 (UTC)
Subject: [Buildroot] svn commit: [25834] trunk/buildroot/scripts
Message-ID: <20090326204739.134AE772E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-26 20:47:38 +0000 (Thu, 26 Mar 2009)
New Revision: 25834

Log:
scripts/setlocalversion: Renamed 'git-svn' to 'git svn'

Git 1.6.x+ got rid of git-<subcommand> in the normal path.

Signed-off-by: Michael Roth <mroth@nessie.de>

Modified:
   trunk/buildroot/scripts/setlocalversion


Changeset:
Modified: trunk/buildroot/scripts/setlocalversion
===================================================================
--- trunk/buildroot/scripts/setlocalversion	2009-03-26 19:37:38 UTC (rev 25833)
+++ trunk/buildroot/scripts/setlocalversion	2009-03-26 20:47:38 UTC (rev 25834)
@@ -21,7 +21,7 @@
 
 	# Is this git on svn?
 	if git config --get svn-remote.svn.url >/dev/null; then
-	        printf -- '-svn%s' "`git-svn find-rev $head`"
+	        printf -- '-svn%s' "`git svn find-rev $head`"
 	fi
 
 	# Are there uncommitted changes?
