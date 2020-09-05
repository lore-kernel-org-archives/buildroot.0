From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2020 14:42:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/mongrel2: fix build with gcc 10
In-Reply-To: <20200905124203.560735-1-fontaine.fabrice@gmail.com>
References: <20200905124203.560735-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905124203.560735-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/858488774503c6cc6a5489bc1e080562f5fc6461

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ition-error-when-building-with-gcc10.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/mongrel2/0004-fix-multiple-definition-error-when-building-with-gcc10.patch

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
-- 
2.28.0
