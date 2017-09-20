From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Sep 2017 12:54:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20170920105436.452-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems github now sometimes provides slightly changed tarballs which
produce a different sha256 hash than before, this is the case for
tvheadend. Instead of fixing the hash lets bump to current HEAD and
hope that the new hash will be valid for a longer period of time ;)

Fixes
http://autobuild.buildroot.net/results/59a/59ad7940dcd498cd0aaec26c8497b21e64379a6f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index a33b0a5e5f..515c36ab99 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 00f67fbf9d8cfea7da90f469b36a8205fb9a38727c4cc5022f4ee5fd322459d3  tvheadend-303f418e1ac2bb3078f7a974b69f04ab6a56c636.tar.gz
+sha256 d61a6e45d0aef2370885be4c58ed95eaa36b2ba1d8fbb75f7759ddc08e020487  tvheadend-0d1cd06fb237504123a08de84afc25d73fa14ba8.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index cf8bee9cee..3eb9161a46 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 303f418e1ac2bb3078f7a974b69f04ab6a56c636
+TVHEADEND_VERSION = 0d1cd06fb237504123a08de84afc25d73fa14ba8
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.11.0
