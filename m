From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:42 +0100
Subject: [Buildroot] [PATCH 18/22] dependencies: remove useless newlines
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

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
-- 
1.7.9.5
