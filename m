From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:52:58 +0200
Subject: [Buildroot] [git commit] svgtiny: create BUILDDIR before
	$(BUILDDIR)/src_colors.c
Message-ID: <20140618123419.74B129CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9019f17c6875a7411579645a8a87adf1ec6bfcf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/5fe/5feca450d70a8de48fa2463e55c9e84db5d755b0/

[Peter: renumber existing patch and this]
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...h => libsvgtiny-01-disable-debug-printfs.patch} |    0
 .../libsvgtiny/libsvgtiny-02-create-builddir.patch |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny-disable-debug-printfs.patch b/package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch
similarity index 100%
rename from package/libsvgtiny/libsvgtiny-disable-debug-printfs.patch
rename to package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch
diff --git a/package/libsvgtiny/libsvgtiny-02-create-builddir.patch b/package/libsvgtiny/libsvgtiny-02-create-builddir.patch
new file mode 100644
index 0000000..a404d86
--- /dev/null
+++ b/package/libsvgtiny/libsvgtiny-02-create-builddir.patch
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
