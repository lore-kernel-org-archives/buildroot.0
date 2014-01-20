From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2014 22:33:44 +0100
Subject: [Buildroot] [git commit] uclibc: bump xtensa snapshot version
Message-ID: <20140120213827.3CA0A9BC28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2ec222ffa4050cd4b549a06cc4348ba9a84c56b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version includes two xtensa fixes:

00571b43df2e libc: posix_fadvise: restore implementation for xtensa
de6561f66693 xtensa: use common ptrace.h

The first fixes (correctly)
http://autobuild.buildroot.net/results/ab1/ab1250c3d402ec3fbaf22eeffd07de218ffafb22/.

The second fixes
http://autobuild.buildroot.net/results/84f/84fb918efbcbf1312a228a9c11608edf096b3c40/.

The unifdef regression (the original motivation for the fixed xtensa snapshot
version introduced in commit cecaf09cd6) should now be fixed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index cc23f76..079a15c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -43,7 +43,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
 	default "9f0f466d3b17181ce88be36ce24a775774fe686c" if BR2_arc
-	default "3a3ad3dfc10876b3648369f22df8fc06661ddef0" if BR2_UCLIBC_VERSION_XTENSA_GIT
+	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
