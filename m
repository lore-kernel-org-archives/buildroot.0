From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:15:35 +0200
Subject: [Buildroot] [git commit] package/bwm-ng: fix build failures with
	gcc-5
Message-ID: <20150818091618.8D209818A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f36ad80b80f9c9bb467caabd4e1ca50c3dda4b9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping to the latest release, for 0.6 -> 0.6.1 to fix gcc-5 build
failures due to incorrect definitions of 'static' functions.

The project also has a new home.

Fixes:
    http://autobuild.buildroot.org/results/546/546b332cf95a48412d88add2feec2ffd4712857c/
    http://autobuild.buildroot.org/results/751/751797f3b97839f69626682ce81dca9bcb2cff22/
    ...

[Thomas: keep only the locally calculated sha256 hash, and do not
mention the commented SF.net hash, since SF.net is no longer the
official upstream location.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bwm-ng/Config.in   |    2 +-
 package/bwm-ng/bwm-ng.hash |    2 +-
 package/bwm-ng/bwm-ng.mk   |    4 ++--
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
index 6bb8355..1d3a240 100644
--- a/package/bwm-ng/bwm-ng.hash
+++ b/package/bwm-ng/bwm-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
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
