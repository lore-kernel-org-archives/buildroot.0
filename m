From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:58:14 +0200
Subject: [Buildroot] [git commit] skeleton: remove SOURCE variable
Message-ID: <20160703111600.E94607F8CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33e2eb50842fcd91bba0b23f2d423d1cea61cca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the package infrastructure doesn't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the skeleton package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton/skeleton.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4e3cdc6..d8d1e70 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-SKELETON_SOURCE =
-
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
