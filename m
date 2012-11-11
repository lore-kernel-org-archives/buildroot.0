From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:39 +0100
Subject: [Buildroot] [PATCH 01/23] dependencies.sh: remove makeinfo
	(texinfo) from the requirement list
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9f0f6a9..403ad75 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -131,12 +131,10 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
+for prog in awk bison flex msgfmt patch gzip bzip2 perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
-	if test $prog = "makeinfo" ; then
-	    /bin/echo -e "makeinfo is usually part of the texinfo package in your distribution\n"
-	elif test $prog = "msgfmt" ; then
+	if test $prog = "msgfmt" ; then
 	    /bin/echo -e "msgfmt is usually part of the gettext package in your distribution\n"
 	elif test $prog = "svn" ; then
 	    /bin/echo -e "svn is usually part of the subversion package in your distribution\n"
-- 
1.8.0
