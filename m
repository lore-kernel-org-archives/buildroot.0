From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Jul 2013 15:30:43 +0200
Subject: [Buildroot] [git commit] Add 'bc' in the mandatory dependencies
Message-ID: <20130705133336.041398194E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cbebbc48c26ddfb18da23ffba356744a5592ea6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since a few kernel releases, having 'bc' installed is mandatory to
build the kernel. See commit
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=70730bca1331fc50c3caacaea00439de1325bd6e
of the kernel.

Since this tool is generally available by default in distributions,
and we're unlikely to see version-specific problems with it, we
just check for it to be installed in
support/dependencies/dependencies.sh.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
