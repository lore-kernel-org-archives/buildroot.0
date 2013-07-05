From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Jul 2013 10:48:09 +0200
Subject: [Buildroot] [PATCH] Add 'bc' in the mandatory dependencies
Message-ID: <1373014089-4489-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since a few kernel releases, having 'bc' installed is mandatory to
build the kernel. See commit
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=70730bca1331fc50c3caacaea00439de1325bd6e
of the kernel.

Since this tool is generally available by default in distributions,
and we're unlikely to see version-specific problems with it, we
just check for it to be installed in
support/dependencies/dependencies.sh.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 0b44c5a..61a4140 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -132,7 +132,7 @@ fi;
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in patch perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
+for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "You must install '$prog' on your build machine";
 	missing_progs="yes"
-- 
1.8.1.2
