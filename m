From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 14:53:58 +0200
Subject: [Buildroot] [git commit] e2fsprogs: fix static build against
	external libblkid
Message-ID: <20140611131923.C42159CFA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98f598a1f439382904745973c56742a9830fad6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0159246b52659508a4bbba4126ab27b28a2b2e2c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...n-fix-external-libblkid-test-for-static-l.patch |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch b/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch
new file mode 100644
index 0000000..65d6c4c
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch
@@ -0,0 +1,34 @@
+From b52e76432fe23490b891884f3a66504101c2a5bd Mon Sep 17 00:00:00 2001
+Message-Id: <b52e76432fe23490b891884f3a66504101c2a5bd.1402480818.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 11 Jun 2014 12:56:15 +0300
+Subject: [PATCH] configure.in: fix external libblkid test for static link
+
+External libblkid needs -luuid when linking statically. Use pkg-config to
+determine it correctly. Adding --static doesn't hurt even for dynamic
+linking.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+Patch status: sent upstream: http://patchwork.ozlabs.org/patch/358584/
+
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 448a2926776a..ec6068320878 100644
+--- a/configure.in
++++ b/configure.in
+@@ -551,7 +551,7 @@ then
+ 		[LIBBLKID=`$PKG_CONFIG --libs blkid`;
+ 		 STATIC_LIBBLKID=`$PKG_CONFIG --static --libs blkid`],
+ 		[AC_MSG_ERROR([external blkid library not found])],
+-		[$LIBBLKID])
++		[`$PKG_CONFIG --static --libs blkid`])
+ 	BLKID_CMT=#
+ 	AC_MSG_RESULT([Disabling private blkid library])
+ else
+-- 
+2.0.0
+
