From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 13:11:08 +0200
Subject: [Buildroot] [git commit] faifa: remove useless CFLAGS
	-Wno-unused-result
Message-ID: <20140611111743.43D969B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a07498decf4f550b4e5a2955985e993f950147f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/961/9614d13769bfdc908e12e3242e7e07630dd08869/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...aifa-001-Makefile.in-Remove-useless-flags.patch |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/faifa/faifa-001-Makefile.in-Remove-useless-flags.patch b/package/faifa/faifa-001-Makefile.in-Remove-useless-flags.patch
new file mode 100644
index 0000000..027215f
--- /dev/null
+++ b/package/faifa/faifa-001-Makefile.in-Remove-useless-flags.patch
@@ -0,0 +1,31 @@
+From 7ad829ab77821f87be9bb26801924aa40936f18f Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Tue, 10 Jun 2014 23:42:17 +0200
+Subject: [PATCH] Makefile.in: Remove useless flags
+
+This flags doesn't hide any warnings and as such doesn't have any
+purposes.
+
+On a plus note, it allow the build with a blackfin toolchain.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 3814d5c..ba65bee 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -13,7 +13,7 @@
+ 
+ CC	= @CC@
+ STRIP	?= $(CROSS)strip
+-CFLAGS	= @CFLAGS@ -Wno-unused-result
++CFLAGS	= @CFLAGS@
+ INSTALL	= @INSTALL@
+ LIBS	= @LIBS@
+ 
+-- 
+2.0.0.rc2
+
