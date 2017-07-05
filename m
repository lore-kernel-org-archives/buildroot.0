From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Wed,  5 Jul 2017 18:33:44 +0800
Subject: [Buildroot] [PATCH] bwm-ng: update to latest upstream version to
	fix build issue
Message-ID: <1499250824-26093-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Keguang Zhang <keguang.zhang@spreadtrum.com>

The latest upstream version had fixed the build issus.

Fixes:
http://autobuild.buildroot.net/results/1d9/1d9f0b62e4cc387f508b4fe0086621ab9996a085/

Signed-off-by: Keguang Zhang <keguang.zhang@spreadtrum.com>
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
-- 
1.9.1
