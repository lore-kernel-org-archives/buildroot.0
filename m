From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 15:13:19 +0200
Subject: [Buildroot] [git commit] package/gcc: switch to gcc 6.x as the
	default
Message-ID: <20170601202856.ADEE782863@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cda724efb20682bb98e6d738e5f7c909415ae07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if gcc 5 is still maintained for some time (gcc 5.5 is pending),
switch to gcc 6.x since it has been released since 2016-04-27 and
gcc 7.x is available since 2017-05-02.

We have been having toolchains in the autobuilders with gcc
6.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 61b0582..4c1d64c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
-	default BR2_GCC_VERSION_5_X
+	default BR2_GCC_VERSION_6_X
 	help
 	  Select the version of gcc you wish to use.
 
