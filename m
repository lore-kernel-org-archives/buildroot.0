From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jan 2017 20:23:12 -0300
Subject: [Buildroot] [PATCH] Revert "gperf: bump to version 3.1"
Message-ID: <20170117232312.3629-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Revert gperf bump, it's breaking everything left and right. Fixes:
http://autobuild.buildroot.net/results/9d5/9d5dad172fe5c5a6247cd5ce6928307236184a64/
http://autobuild.buildroot.net/results/872/8728860024c7d114fb5b8df3f55588ac09ecf323/

And probably other packages as well.

This reverts commit 570c8d2ae6a10e10b45adc75145726994219f946.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gperf/gperf.hash | 2 +-
 package/gperf/gperf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index dae8342..370235c 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2  gperf-3.1.tar.gz
+sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 014a245..8ce3c95 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPERF_VERSION = 3.1
+GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPLv3+
 GPERF_LICENSE_FILES = COPYING
-- 
2.10.2
