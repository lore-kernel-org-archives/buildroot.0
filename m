From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:42:16 +0200
Subject: [Buildroot] [git commit] package/gcc: switch to gcc 8.x as the
 default
Message-ID: <20190622194128.2475D83452@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a8cc22331b9891f95696c401a4790dd35bccacd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if gcc 7 is still maintained for some time (gcc 7.5 is pending),
switch to gcc 8.x since it has been released since 2018-05-02 and
gcc 9.x is available since 2019-05-03.

We have been having toolchains in the autobuilders with gcc
8.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 66c59c66c4..239353d3f7 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
-	default BR2_GCC_VERSION_7_X
+	default BR2_GCC_VERSION_8_X
 	help
 	  Select the version of gcc you wish to use.
 
