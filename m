From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Mon, 21 Oct 2013 08:39:17 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: fix autobuilder failure
Message-ID: <1382362757-24499-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://autobuild.buildroot.net/results/e3244abc550a95eb69e63b8db203f39b27f3288e/

Turns out omniorb isn't building because of an old cross compile patch.
The last patchset was missing the delete.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 .../omniorb-0001-crosscompile-tool-export.patch    |   30 --------------------
 1 files changed, 0 insertions(+), 30 deletions(-)
 delete mode 100644 package/omniorb/omniorb-0001-crosscompile-tool-export.patch

diff --git a/package/omniorb/omniorb-0001-crosscompile-tool-export.patch b/package/omniorb/omniorb-0001-crosscompile-tool-export.patch
deleted file mode 100644
index 260d86f..0000000
--- a/package/omniorb/omniorb-0001-crosscompile-tool-export.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-beforeauto.mk.in: added support for overriding the configure time
-defined CC/CXX/RANLIB/CPP variables so that a couple pkg tools could be
-built which generate code during the cross compile build.
-
-http://www.omniorb-support.com/pipermail/omniorb-list/2013-September/031473.html
-
-Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
-
---- omniorb-4.1.6.orig/mk/beforeauto.mk.in	2013-09-12 12:49:55.668708148 -0500
-+++ omniorb-4.1.6/mk/beforeauto.mk.in	2013-09-12 12:51:22.707928579 -0500
-@@ -672,15 +672,15 @@
- #
- 
- AR              = ar cq
--CC              = @CC@
--CXX             = @CXX@
--RANLIB		= @RANLIB@
-+CC		?= @CC@
-+CXX		?= @CXX@
-+RANLIB		?= @RANLIB@
- MKDIRHIER	= $(BASE_OMNI_TREE)/bin/scripts/omkdirhier
- INSTLIBFLAGS	= -m 0644
- INSTEXEFLAGS	= -m 0755
- CP		= cp
- MV		= mv -f
--CPP		= @CPP@
-+CPP		?= @CPP@
- OMKDEPEND	= $(TOOLBINDIR)/omkdepend
- RMDIRHIER	= $(RM) -rf
- 
-- 
1.7.1
