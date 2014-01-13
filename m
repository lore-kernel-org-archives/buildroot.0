From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2014 08:26:12 +0200
Subject: [Buildroot] [PATCH v2 1/3] uclibc: bump xtensa snapshot version
In-Reply-To: <cover.1389594195.git.baruch@tkos.co.il>
References: <cover.1389594195.git.baruch@tkos.co.il>
Message-ID: <2cb50cbfb9dff5627aecbebc8cd4d1bd76c505f1.1389594195.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---

This supersedes http://patchwork.ozlabs.org/patch/305872/.
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index cc23f769b087..079a15c98909 100644
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
-- 
1.8.5.2
