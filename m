From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 14:09:20 +0200
Subject: [Buildroot] [git commit] dtc: don't treat warnings as errors
Message-ID: <20140428121300.4AF6B9C9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=913cf72c80ee8305aa867d52d73be6aa8d67727e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c1e/c1e0764f27e6c842a2a324b7b2dc5052ff10f13b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtc/dtc-extra_cflags.patch |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/dtc-extra_cflags.patch
index 3ce699b..51b7957 100644
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
