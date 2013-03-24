From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:51:32 +0100
Subject: [Buildroot] [git commit] dependencies: remove useless newlines
Message-ID: <20130324130052.AA9BD9B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a8dbba84d39ac20dc61ce3bc9180cfb164e4cc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index cd3c839..9d06a0d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -133,11 +133,9 @@ fi;
 # Check that a few mandatory programs are installed
 for prog in patch perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
-	/bin/echo -e "\nYou must install '$prog' on your build machine";
+	/bin/echo -e "You must install '$prog' on your build machine";
 	if test $prog = "svn" ; then
-	    /bin/echo -e "svn is usually part of the subversion package in your distribution\n"
-	else
-	    /bin/echo -e "\n"
+	    /bin/echo -e "svn is usually part of the subversion package in your distribution"
 	fi
 	exit 1;
     fi
