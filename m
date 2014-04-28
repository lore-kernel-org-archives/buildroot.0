From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Apr 2014 13:53:56 +0300
Subject: [Buildroot] [PATCH] dtc: don't treat warnings as errors
Message-ID: <6360c91eb09e1bfa808ce9c3ea79501055974743.1398682436.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c1e/c1e0764f27e6c842a2a324b7b2dc5052ff10f13b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dtc/dtc-extra_cflags.patch | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/dtc-extra_cflags.patch
index 3ce699b5d864..51b79572e8bf 100644
--- a/package/dtc/dtc-extra_cflags.patch
+++ b/package/dtc/dtc-extra_cflags.patch
@@ -13,12 +13,16 @@ Patch not sent upstream.
 Although not specific to buildroot, I am not sure this is the best
 way to handle user-supplied CFLAGS.
 
-diff -durN dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile
---- dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile	2012-10-22 22:02:47.541240846 +0200
-+++ dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile	2012-10-22 22:03:21.151047833 +0200
-@@ -18,7 +18,8 @@
+diff --git a/Makefile b/Makefile
+index 962f94eba661..bf6b317158cf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,9 +16,10 @@ LOCAL_VERSION =
+ CONFIG_LOCALVERSION =
+ 
  CPPFLAGS = -I libfdt -I .
- WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
+-WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
++WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
 -CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
 +CFLAGS ?= -g -Os
-- 
1.9.2
