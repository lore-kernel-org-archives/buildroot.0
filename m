From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jul 2015 11:50:19 -0300
Subject: [Buildroot] [PATCH] coreutils: bump to version 8.24
Message-ID: <1436021419-20934-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/coreutils/0001-fix-for-dummy-man-usage.patch | 18 +++++++++---------
 package/coreutils/coreutils.hash                     |  2 +-
 package/coreutils/coreutils.mk                       |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/coreutils/0001-fix-for-dummy-man-usage.patch b/package/coreutils/0001-fix-for-dummy-man-usage.patch
index 960501e..4c5a088 100644
--- a/package/coreutils/0001-fix-for-dummy-man-usage.patch
+++ b/package/coreutils/0001-fix-for-dummy-man-usage.patch
@@ -8,18 +8,18 @@ would appear when compiling.
 "dummy-man: too many non-option arguments"
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Gustavo: update for 8.23]
+[Gustavo: update for 8.24]
 
-diff -Nura coreutils-8.23.orig/man/local.mk coreutils-8.23/man/local.mk
---- coreutils-8.23.orig/man/local.mk	2014-10-24 16:52:29.720555852 -0300
-+++ coreutils-8.23/man/local.mk	2014-10-24 16:52:59.381391498 -0300
-@@ -101,8 +101,8 @@
+diff -Nura coreutils-8.24.orig/man/local.mk coreutils-8.24/man/local.mk
+--- coreutils-8.24.orig/man/local.mk	2015-07-04 11:23:47.190503631 -0300
++++ coreutils-8.24/man/local.mk	2015-07-04 11:24:25.046741090 -0300
+@@ -186,8 +186,8 @@
  	  && $(run_help2man)						\
  		     --source='$(PACKAGE_STRING)'			\
  		     --include=$(srcdir)/man/$$name.x			\
--		     --output=$$t/$$name.1 $$t/$$argv			\
- 		     --info-page='coreutils \(aq'$$name' invocation\(aq' \
-+		     --output=$$t/$$name.1 $$t/$$argv			\
+-		     --output=$$t/$$name.1				\
+ 		     --info-page='\(aq(coreutils) '$$name' invocation\(aq' \
++		     --output=$$t/$$name.1				\
+ 		     $$t/$$argv$(EXEEXT)				\
  	  && sed \
  	       -e 's|$*\.td/||g' \
- 	       -e '/For complete documentation/d' \
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 760b146..21a2545 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d	coreutils-8.23.tar.xz
+sha256	a2d75286a4b9ef3a13039c2da3868a61be4ee9f17d8ae380a35a97e506972170	coreutils-8.24.tar.xz
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 8901d23..bb2ef96 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.23
+COREUTILS_VERSION = 8.24
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPLv3+
-- 
2.3.6
