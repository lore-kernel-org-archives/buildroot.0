From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:42:27 +0200
Subject: [Buildroot] [git commit] Revert "apply-patches: catch unexpected
	failure"
Message-ID: <20160705154241.1A0DD8212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75d8977ba8373cb6d52f5d866adce747ef15a8da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 9cf1ad6cdb37c5be5772121896f4b13ec42c2b0d.

This breaks many packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/apply-patches.sh | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 11fa5bf..694302d 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -31,9 +31,6 @@
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
-# We want to catch any unexpected failure, and exit immediately.
-set -e
-
 silent=
 if [ "$1" = "-s" ] ; then
     # add option to be used by the patch tool
