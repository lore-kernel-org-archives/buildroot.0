From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:43 +0100
Subject: [Buildroot] [PATCH 19/22] dependencies: add details about which
	distro package to install
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9d06a0d..ab7f4a4 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -135,7 +135,13 @@ for prog in patch perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "You must install '$prog' on your build machine";
 	if test $prog = "svn" ; then
-	    /bin/echo -e "svn is usually part of the subversion package in your distribution"
+	    /bin/echo -e "  svn is usually part of the subversion package in your distribution"
+	elif test $prog = "hg" ; then
+            /bin/echo -e "  hg is usually part of the mercurial package in your distribution"
+	elif test $prog = "zcat" ; then
+            /bin/echo -e "  zcat is usually part of the gzip package in your distribution"
+	elif test $prog = "bzcat" ; then
+            /bin/echo -e "  bzcat is usually part of the bzip2 package in your distribution"
 	fi
 	exit 1;
     fi
-- 
1.7.9.5
