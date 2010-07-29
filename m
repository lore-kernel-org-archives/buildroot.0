From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:44 +0200
Subject: [Buildroot] [PATCH 01/19] dependencies: add svn as a mandatory tool
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3b207de011d13042b589031061bbe0d940e7b204.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that two packages (tremor and libsvgtiny) are being downloaded
from svn, svn becomes a mandatory tool to run Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 96f843f..b3822ef 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -137,13 +137,15 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python svn ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
 	    /bin/echo -e "makeinfo is usually part of the texinfo package in your distribution\n"
 	elif test $prog = "msgfmt" ; then
 	    /bin/echo -e "msgfmt is usually part of the gettext package in your distribution\n"
+	elif test $prog = "svn" ; then
+	    /bin/echo -e "svn is usually part of the subversion package in your distribution\n"
 	else
 	    /bin/echo -e "\n"
 	fi
-- 
1.7.0.4
