From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 16:53:11 +0200
Subject: [Buildroot] [PATCHv2] [autobuild] package/bwm-ng: fix build
	failures with gcc-5
Message-ID: <1439736791-28748-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to the latest release, for 0.6 -> 0.6.1 to fix gcc-5 build
failures due to incorrect definitions of 'static' functions.

The project also has a new home.

Fixes:
    http://autobuild.buildroot.org/results/546/546b332cf95a48412d88add2feec2ffd4712857c/
    http://autobuild.buildroot.org/results/751/751797f3b97839f69626682ce81dca9bcb2cff22/
    ...

Notes: the project does not provide hashes on its new location, even
though SF.net still has the new file. But as stated on the new home,
SF.net "will not be used anymore". And as stated by Baruch, "the dubious
reputation of sf.net as of late, I don't think we can rely on their
hashes in the long run". So, we only refer to the SF.net hash for
reference, but use a locally computed, stronger sha256 as was previously
the case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - point to SF.net for the origin of the sha1, but only use a locally
    computed sha256  (Baruch)
---
 package/bwm-ng/Config.in   | 2 +-
 package/bwm-ng/bwm-ng.hash | 6 ++++--
 package/bwm-ng/bwm-ng.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

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
index 6bb8355..85f436f 100644
--- a/package/bwm-ng/bwm-ng.hash
+++ b/package/bwm-ng/bwm-ng.hash
@@ -1,2 +1,4 @@
-# Locally calculated
-sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
+# From: http://sourceforge.net/projects/bwmng/files/bwmng/0.6/
+# sha1  9445885d05e2430ca174739e3aba343afce94076  bwm-ng-0.6.1.tar.gz
+# Because we do not trust SF.net, locally computed sha256:
+sha256  027cf3c960cd96fc9ffacdf7713df62d0fc55eeef4a1388289f8a62ae5e50df0  bwm-ng-0.6.1.tar.gz
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
