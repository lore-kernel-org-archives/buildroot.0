From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 22:29:51 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump to version 2019b
Message-ID: <20190903133624.12FEF8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60889ccdf07e7553024e098acdd24902b0d0b8d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE to https.

Add hash for license file.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
[Peter: fix LICENSE hash, only use for the host package]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.hash | 6 ++++--
 package/tzdata/tzdata.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 6a0ea17ce9..b21e195b43 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2018-May/000050.html
-sha512 d059fcd381b2f6ecdafcd68fdd2a00451d1bf9b1affeb164ae7cabca2e022d499e77f0706ec3f3091b8e84c2211aa66da6c90937108771f1bf070cfebc105cae	tzdata2018e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2019-July/000056.html
+sha512 c0104078d994e501d80a41bea31364b1390a75c2fbf42968a8343a090e2ac2eddbc58770ca470b192ea19dec89fcc634141a1de703ea2ffa0325176a64afe1fc tzdata2019b.tar.gz
+# Locally computed:
+sha256 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index e20c946208..14f25e8766 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2018e
+TZDATA_VERSION = 2019b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
-TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
+TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
+HOST_TZDATA_LICENSE_FILES = LICENSE
 
 # Take care when re-ordering this list since this might break zone
 # dependencies
