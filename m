From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 09:41:43 +0200
Subject: [Buildroot] [git commit] package/mongrel2: fix build with gcc 10
Message-ID: <20200906074138.00C6D821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95235737eb519ff28ab78bd01700a512cd85219e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/858488774503c6cc6a5489bc1e080562f5fc6461

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...definition-error-when-building-with-gcc10.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/mongrel2/0004-fix-multiple-definition-error-when-building-with-gcc10.patch b/package/mongrel2/0004-fix-multiple-definition-error-when-building-with-gcc10.patch
new file mode 100644
index 0000000000..e1b5788494
--- /dev/null
+++ b/package/mongrel2/0004-fix-multiple-definition-error-when-building-with-gcc10.patch
@@ -0,0 +1,25 @@
+From c51815b10c39c6e802bd1b56549f1d479b480fcc Mon Sep 17 00:00:00 2001
+From: Andrew Sun <adsun701@gmail.com>
+Date: Sat, 18 Jul 2020 09:11:11 -0400
+Subject: [PATCH] fix multiple definition error when building with gcc10
+
+[Retrieved from:
+https://github.com/mongrel2/mongrel2/pull/343/commits/c51815b10c39c6e802bd1b56549f1d479b480fcc]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/unixy.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/unixy.h b/src/unixy.h
+index 045e7c28..4225220c 100644
+--- a/src/unixy.h
++++ b/src/unixy.h
+@@ -38,7 +38,7 @@
+ #include <bstring.h>
+ #include <unistd.h>
+ 
+-char *m2program;
++extern char *m2program;
+ 
+ int Unixy_chroot(bstring path);
+ 
