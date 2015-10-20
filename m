From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 16:33:07 +0200
Subject: [Buildroot] [git commit] tstools: GitHub migration
Message-ID: <20151020143645.F3EB4818D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c9aceea9014d87aa0852d0e4494559ee634984e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tstools has migrated to GitHub, so let's use this opportuninty to rework
this package as well.

- Change site to GitHub.
- No releases of tags yet, so let's use the latest commit ID from the
  master branch as a version.
- There is currently no license file attributed to tstools, so state that
  in the tstools.mk file and add empty license file variable. This issue is
  being tracked upstream: https://github.com/kynesim/tstools/issues/32
- Wrap the help text in the Config.in to 72 characters, and also change
  the project URL to the GitHub one.
- Add a hash file.
- Rename the patch to use a four digit numbering (001 -> 0001).

[Peter: leave license as MPLv1.1, adjust comment to match]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...h => 0001-build-get-along-with-buildroot.patch} |    0
 package/tstools/Config.in                          |   19 +++++++++----------
 package/tstools/tstools.hash                       |    2 ++
 package/tstools/tstools.mk                         |   11 +++++++----
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/package/tstools/001-build-get-along-with-buildroot.patch b/package/tstools/0001-build-get-along-with-buildroot.patch
similarity index 100%
rename from package/tstools/001-build-get-along-with-buildroot.patch
rename to package/tstools/0001-build-get-along-with-buildroot.patch
diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index 706cb54..f5dd138 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -2,16 +2,15 @@ config BR2_PACKAGE_TSTOOLS
 	bool "tstools"
 	depends on BR2_USE_MMU # fork()
 	help
-	  This is a set of cross-platform command line tools for
-	  working with MPEG data
+	  This is a set of cross-platform command line tools for working with
+	  MPEG data.
 
-	  The emphasis is on relatively simple tools which concentrate
-	  on MPEG (H.264 and H.262) data packaged according to H.222
-	  (i.e., TS or PS), with a particular interest in checking for
-	  conformance.
+	  The emphasis is on relatively simple tools which concentrate on MPEG
+	  (H.264 and H.262) data packaged according to H.222 (i.e., TS or PS),
+	  with a particular interest in checking for conformance.
 
-	  Transport Stream (TS) is typically used for distribution of
-	  cable and satellite data. Program Stream (PS) is typically
-	  used to store data on DVDs.
+	  Transport Stream (TS) is typically used for distribution of cable
+	  and satellite data. Program Stream (PS) is typically used to store
+	  data on DVDs.
 
-	  https://code.google.com/p/tstools/
+	  https://github.com/kynesim/tstools/
diff --git a/package/tstools/tstools.hash b/package/tstools/tstools.hash
new file mode 100644
index 0000000..9b0f1c7
--- /dev/null
+++ b/package/tstools/tstools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3d2b2375e2874933f9aa59d4f25bb6b334747219eb0d7a076974e61222d59bf6  tstools-08f6be304040e7b84760ac3920bcff4a563b6cd2.tar.gz
diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
index 40920d2..3355db8 100644
--- a/package/tstools/tstools.mk
+++ b/package/tstools/tstools.mk
@@ -4,10 +4,13 @@
 #
 ################################################################################
 
-TSTOOLS_VERSION = 1_11
-TSTOOLS_SITE = https://tstools.googlecode.com/files
-TSTOOLS_SOURCE = tstools-$(TSTOOLS_VERSION).tgz
-TSTOOLS_LICENSE = MPL v1.1
+# No releases or tags yet. Use the latest commit ID from master branch.
+TSTOOLS_VERSION = 08f6be304040e7b84760ac3920bcff4a563b6cd2
+TSTOOLS_SITE = $(call github,kynesim,tstools,$(TSTOOLS_VERSION))
+# tstools upstream doesn't contain any license file so far. See:
+# https://github.com/kynesim/tstools/issues/32
+TSTOOLS_LICENSE = MPLv1.1
+TSTOOLS_LICENSE_FILES =
 
 define TSTOOLS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) LD="$(TARGET_CC)" $(TARGET_MAKE_ENV) \
