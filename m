From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:57:44 +0200
Subject: [Buildroot] [git commit] package/gcc: switch to gcc 9.x as the
 default
Message-ID: <20200624195533.2188583FD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbcf6174f5fee80bd824f81fccfa52477fea076f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if gcc 8 is still maintained for some time (gcc 8.5 is pending),
switch to gcc 9.x since it has been released since 2019-05-03 and
gcc 10.x is available since 2020-05-07.

We have been having toolchains in the autobuilders with gcc
9.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index c7444e243b..f417712b52 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_CSKY if BR2_csky
-	default BR2_GCC_VERSION_8_X
+	default BR2_GCC_VERSION_9_X
 	help
 	  Select the version of gcc you wish to use.
 
