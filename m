From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:56:01 +0100
Subject: [Buildroot] [git commit] dependencies: add details about which
	distro package to install
Message-ID: <20130324130053.0C0CE9B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2406e4a7852cadb5cfb5af59fd6a437bdc3b0eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

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
