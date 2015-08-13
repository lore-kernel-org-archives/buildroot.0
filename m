From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2015 23:07:58 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/bwm-ng: fix build failures
	with gcc-5
Message-ID: <1439500078-22674-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to the latest release, for 0.6 -> 0.6.1 to fix gcc-5 build
failures due to incorrect definitions of 'static' functions.

The project also has a new home.

fixes:
    http://autobuild.buildroot.org/results/546/546b332cf95a48412d88add2feec2ffd4712857c/
    http://autobuild.buildroot.org/results/751/751797f3b97839f69626682ce81dca9bcb2cff22/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/bwm-ng/Config.in   | 2 +-
 package/bwm-ng/bwm-ng.hash | 2 +-
 package/bwm-ng/bwm-ng.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bwm-ng/Config.in b/package/bwm-ng/Config.in
index 25e7cbe..f93dd93 100644
--- a/package/bwm-ng/Config.in
+++ b/package/bwm-ng/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_BWM_NG
 	  network and disk-io bandwidth monitor for Linux, BSD,
 	  Solaris, Mac OS X and others.
 
-	  http://sourceforge.net/projects/bwmng/
+	  http://www.gropp.org/?id=projects&sub=bwm-ng
diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
index 6bb8355..44272b1 100644
--- a/package/bwm-ng/bwm-ng.hash
+++ b/package/bwm-ng/bwm-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
+sha1  9445885d05e2430ca174739e3aba343afce94076  bwm-ng-0.6.1.tar.gz
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index ed1f5aa..e285422 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BWM_NG_VERSION = 0.6
-BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)
+BWM_NG_VERSION = 0.6.1
+BWM_NG_SITE = http://www.gropp.org/bwm-ng
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPLv2
 BWM_NG_LICENSE_FILES = COPYING
-- 
1.9.1
