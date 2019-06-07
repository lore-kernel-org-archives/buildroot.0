From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri,  7 Jun 2019 19:34:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libevent: bump to version 2.1.10
Message-ID: <1559928848-27814-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://github.com/libevent/libevent/releases/tag/release-2.1.10-stable

Also fix check-package warning.

Fixes:

$. ./utils/check-package package/libevent/* -v
package/libevent/0001-Disable-building-test-programs.patch:4: generate your patches with 'git format-patch -N'
Subject: [PATCH 1/2] Disable building test programs
76 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libevent/0001-Disable-building-test-programs.patch | 2 +-
 package/libevent/libevent.hash                             | 2 +-
 package/libevent/libevent.mk                               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevent/0001-Disable-building-test-programs.patch b/package/libevent/0001-Disable-building-test-programs.patch
index a1ce774..cac05ec 100644
--- a/package/libevent/0001-Disable-building-test-programs.patch
+++ b/package/libevent/0001-Disable-building-test-programs.patch
@@ -1,7 +1,7 @@
 From 4b5a135fa681e85eb6988a379f59f3c7a41cc48c Mon Sep 17 00:00:00 2001
 From: Gilles Talis <gilles.talis@gmail.com>
 Date: Fri, 21 Jun 2013 15:25:11 -0700
-Subject: [PATCH 1/2] Disable building test programs
+Subject: [PATCH] Disable building test programs
 
 We are not really interested in building test programs.
 Moreover, these programs use fork() function that is
diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index aa0358b..8933197 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,4 +1,4 @@
 # locally computed
 md5	f3eeaed018542963b7d2416ef1135ecc	libevent-2.1.8-stable.tar.gz
-sha1	2a1b8bb7a262d3fd0ed6a080a20991a6eed675ec	libevent-2.1.8-stable.tar.gz
+sha1	609b14bd2eeb3b48272b607656fa9e1d3318c5e2	libevent-2.1.10-stable.tar.gz
 sha256	ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670	LICENSE
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index f0c989a..e0c0b25 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.1.8-stable
+LIBEVENT_VERSION = 2.1.10-stable
 LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
-- 
2.7.4
