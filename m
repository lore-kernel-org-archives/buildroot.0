From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 May 2019 13:40:19 -0400
Subject: [Buildroot] [PATCH 1/1] package/tzdata and package/zic: bump to
 version 2019a
Message-ID: <20190517174019.65050-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also add TZDATA_LICENSE_FILES and ZIC_LICENSE_FILES, and hashes for those
files.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/tzdata/tzdata.hash | 5 +++--
 package/tzdata/tzdata.mk   | 3 ++-
 package/zic/zic.hash       | 5 +++--
 package/zic/zic.mk         | 3 ++-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 6a0ea17ce9..5884a76a17 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,3 @@
-# From https://mm.icann.org/pipermail/tz-announce/2018-May/000050.html
-sha512 d059fcd381b2f6ecdafcd68fdd2a00451d1bf9b1affeb164ae7cabca2e022d499e77f0706ec3f3091b8e84c2211aa66da6c90937108771f1bf070cfebc105cae	tzdata2018e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2019-March/000055.html
+sha512 d8eb5b2b68abee08bd2b0d2134bce85b5c0aee85168e9697a607604ed5be7d1539ac60fda9b37e0c9c793ef6251978bc250563a0af59497fde775499964bb5aa	tzdata2019a.tar.gz
+sha512 9fe102f8894714cd0bd7d72a92e5ca29e4f75ff3f802d6fc363d5349b83345251b1d572a35321bd487cc70485da337b90df0cd37f896b6343f6f4c29cba7a295 LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index e20c946208..1d98393e62 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2018e
+TZDATA_VERSION = 2019a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
+TZDATA_LICENSE_FILES = LICENSE
 
 # Take care when re-ordering this list since this might break zone
 # dependencies
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 6b7994731c..dca2a5fbec 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,3 @@
-# From https://mm.icann.org/pipermail/tz-announce/2018-May/000050.html
-sha512 4a245cae2d0922b24539a94cf4a8ccc2bba1ee696e0aaefecb41c7c8d78724a7fcea6039909336177b8b26fec8fc47719e3e56ca9839dbaf52f9a4fec84d4717	tzcode2018e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2019-March/000055.html
+sha512 7cc76ce6be4a67c3e1b2222cb632d2de9dabb76899793a938f87a1d4bb20e462cabdae9e3b986aaabaa400795370510095d236dbad5aff4c192d0887f0ecedf5	tzcode2019a.tar.gz
+sha256 9fe102f8894714cd0bd7d72a92e5ca29e4f75ff3f802d6fc363d5349b83345251b1d572a35321bd487cc70485da337b90df0cd37f896b6343f6f4c29cba7a295 LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 224b7ab407..c1e088459f 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2018e
+ZIC_VERSION = 2019a
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
+ZIC_LICENSE_FILES = LICENSE
 
 define HOST_ZIC_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
-- 
2.21.0
