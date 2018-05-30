From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 21:45:28 +0200
Subject: [Buildroot] [git commit branch/next] package/gcc: switch to gcc 6.x
 as the default
Message-ID: <20180530202335.CA3CD8351F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce67f68882f14ac5c7bd5cfefe5bb18f856756d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Even if gcc 6 is still maintained for some time (gcc 6.5 is pending),
switch to gcc 7.x since it has been released since 2017-05-02 and
gcc 8.x is available since 2018-05-02.

We have been having toolchains in the autobuilders with gcc
7.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 09d88fc929..c9a20f6d77 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
-	default BR2_GCC_VERSION_6_X
+	default BR2_GCC_VERSION_7_X
 	help
 	  Select the version of gcc you wish to use.
 
