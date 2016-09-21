From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 08:58:56 +0200
Subject: [Buildroot] [git commit] gcc: switch to gcc 5.x as the default
Message-ID: <20160921071839.A5FEE8222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6ee58de3ed5cba52418785f41e1bea91c1d2ab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 4.9.4 was the last release of the 4.9.x branch, and the gcc
developes will now only be maintaining gcc 5.x and 6.x:

  https://gcc.gnu.org/ml/gcc-announce/2016/msg00002.html

Therefore, it is time to use gcc 5.x as the default version in
Buildroot. We have been having toolchains in the autobuilders with gcc
5.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3460fdd..6ecc2f0 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,7 +9,7 @@ config BR2_GCC_SUPPORTS_GRAPHITE
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
-	default BR2_GCC_VERSION_4_9_X
+	default BR2_GCC_VERSION_5_X
 	help
 	  Select the version of gcc you wish to use.
 
