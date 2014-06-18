From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 18 Jun 2014 10:57:12 +0400
Subject: [Buildroot] [PATCH] svgtiny: create BUILDDIR before
	$(BUILDDIR)/src_colors.c
Message-ID: <1403074632-28224-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/5fe/5feca450d70a8de48fa2463e55c9e84db5d755b0/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../libsvgtiny-100-create-builddir.patch           |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 package/libsvgtiny/libsvgtiny-100-create-builddir.patch

diff --git a/package/libsvgtiny/libsvgtiny-100-create-builddir.patch b/package/libsvgtiny/libsvgtiny-100-create-builddir.patch
new file mode 100644
index 0000000..a404d86
--- /dev/null
+++ b/package/libsvgtiny/libsvgtiny-100-create-builddir.patch
@@ -0,0 +1,15 @@
+svgtiny: create BUILDDIR before $(BUILDDIR)/src_colors.c
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+--- libsvgtiny-12121/src/Makefile.orig	2014-06-17 15:30:21.765311434 +0400
++++ libsvgtiny-12121/src/Makefile	2014-06-17 15:29:56.569909931 +0400
+@@ -3,7 +3,7 @@
+ 
+ SOURCES := $(SOURCES) $(BUILDDIR)/src_colors.c
+ 
+-$(BUILDDIR)/src_colors.c: src/colors.gperf
++$(BUILDDIR)/src_colors.c: src/colors.gperf $(BUILDDIR)/stamp
+ 	$(VQ)$(ECHO) "   GPERF: $<"
+ 	$(Q)gperf --output-file=$@.tmp $<
+ # Hack for GCC 4.2 compatibility (gperf 3.0.4 solves this properly)
-- 
1.7.7.6
