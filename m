From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 23:07:34 +0200
Subject: [Buildroot] [git commit] apply-patches.sh: avoid reversed/already
	applied patches
Message-ID: <20130917210737.AA5349B7BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eca77d0429f531a6f377da5d25d8ee72cd98a449
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable reversed/already applied patches fallout from commit
5871b791995ebe295db7dca608afe3f293ce8953
Reverse patches are bad, they may unfix things with version bumps and
just sneak under the radar with pure batch mode.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1ebaea9..ff72b45 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -84,7 +84,7 @@ function apply_patch {
 	exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
