From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 21:51:17 +0200
Subject: [Buildroot] [git commit] gcc: switch to gcc 4.8.x as the default
	compiler version
Message-ID: <20140601200641.22FB09CE45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d997bf7bc5acc89b2de60efe69fbcb7c66a2a11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 4.7.x is going to be retired soon, and now that gcc 4.9.0 is out,
it's time for Buildroot to switch to gcc 4.8.x as the default gcc
compiler version.

See https://gcc.gnu.org/ml/gcc/2014-05/msg00324.html for details about
gcc 4.7.x life cycle.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fd2c5e8..60835e9 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -11,7 +11,7 @@ choice
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
-	default BR2_GCC_VERSION_4_7_X
+	default BR2_GCC_VERSION_4_8_X
 	help
 	  Select the version of gcc you wish to use.
 
