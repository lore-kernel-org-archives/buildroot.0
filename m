From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 16:32:52 +0100
Subject: [Buildroot] [git commit] webkit: disable on powerpc
Message-ID: <20140223153613.BE9159B838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39a0fa4b0d85389f85f2cfe126e2f10f94542cb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

webkit does not build correctly on powerpc. There is an upstream bug report
with a partial fix, but with remaining problems.
https://bugs.webkit.org/show_bug.cgi?id=113638

Until this problem is fixed, we disable webkit on powerpc.

Fixes
http://autobuild.buildroot.org/results/3ce/3ce992a663ddf1030a987bb778f8275a8e5fdef0/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 45f2058..0486490 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -4,7 +4,9 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	default y if (BR2_arm || BR2_armeb) && \
 		!(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
-		BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64
+		BR2_sh || BR2_sparc || BR2_x86_64
+
+# disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
 
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
