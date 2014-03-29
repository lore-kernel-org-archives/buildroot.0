From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 17:49:03 +0100
Subject: [Buildroot] [git commit] coreutils: bump to 8.22 to fix build on
	AArch64
Message-ID: <20140329164950.4EBDA9C3E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b44149a2251081d9180651ae5f8a184705e3835
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/25c/25cfb126c01aa70f4666709dddbff298813b5c69/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../coreutils-03-fix-for-dummy-man-usage.patch     |   31 ++++++++++++++++++++
 package/coreutils/coreutils.mk                     |    2 +-
 2 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils-03-fix-for-dummy-man-usage.patch b/package/coreutils/coreutils-03-fix-for-dummy-man-usage.patch
new file mode 100644
index 0000000..b7e8260
--- /dev/null
+++ b/package/coreutils/coreutils-03-fix-for-dummy-man-usage.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending
+
+coreutils: fix for dummy-man usage
+
+The options should be before the final argument, otherwise, the following error
+would appear when compiling.
+
+"dummy-man: too many non-option arguments"
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ man/local.mk |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/man/local.mk b/man/local.mk
+index 7cef5e3..dc0865f 100644
+--- a/man/local.mk
++++ b/man/local.mk
+@@ -189,8 +189,8 @@ man/yes.1:       src/yes
+ 	  && $(run_help2man)						\
+ 		     --source='$(PACKAGE_STRING)'			\
+ 		     --include=$(srcdir)/man/$$name.x			\
+-		     --output=$$t/$$name.1 $$t/$$name			\
+ 		     --info-page='coreutils \(aq'$$name' invocation\(aq' \
++		     --output=$$t/$$name.1 $$t/$$name			\
+ 	  && sed \
+ 	       -e 's|$*\.td/||g' \
+ 	       -e '/For complete documentation/d' \
+-- 
+1.7.9.5
+
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 7208752..c90396d 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.21
+COREUTILS_VERSION = 8.22
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPLv3+
