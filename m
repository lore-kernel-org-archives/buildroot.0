From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 09:10:44 +0200
Subject: [Buildroot] [git commit] bwm-ng: update to latest upstream version
	to fix build issue
Message-ID: <20170719070656.6D2A28165D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d54c8415816a8116185b495822bfc6ec44f4071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest upstream version has fixed the build issue.

Fixes:

  http://autobuild.buildroot.net/results/1d9f0b62e4cc387f508b4fe0086621ab9996a085/

Signed-off-by: Keguang Zhang <keguang.zhang@spreadtrum.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bwm-ng/bwm-ng.hash | 2 +-
 package/bwm-ng/bwm-ng.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
index 1d3a240..4c12b0d 100644
--- a/package/bwm-ng/bwm-ng.hash
+++ b/package/bwm-ng/bwm-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  027cf3c960cd96fc9ffacdf7713df62d0fc55eeef4a1388289f8a62ae5e50df0  bwm-ng-0.6.1.tar.gz
+sha256  4b34a8ac2eae2d204d6dea8258c5e34b37094259086f8c9169391409a9311fb5  bwm-ng-f54b3fad2c80bfe63f920c9b5e7c1d80389c57ef.tar.gz
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 85ee689..587ffbe 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-BWM_NG_VERSION = 0.6.1
-BWM_NG_SITE = http://www.gropp.org/bwm-ng
+BWM_NG_VERSION = f54b3fad2c80bfe63f920c9b5e7c1d80389c57ef
+BWM_NG_SITE = $(call github,vgropp,bwm-ng,$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPL-2.0
 BWM_NG_LICENSE_FILES = COPYING
+BWM_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 BWM_NG_CONF_OPTS += --with-ncurses
