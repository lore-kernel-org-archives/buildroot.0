From: Christopher McCrory <chrismcc@gmail.com>
Date: Wed, 28 Aug 2019 15:29:33 -0700
Subject: [Buildroot] [PATCH 2/2] package/zic: bump to version 2019b
Message-ID: <20190828222933.11602-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE to https.

Add hash for license file.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/zic/zic.hash | 6 ++++--
 package/zic/zic.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 6b7994731c..385accadf2 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2018-May/000050.html
-sha512 4a245cae2d0922b24539a94cf4a8ccc2bba1ee696e0aaefecb41c7c8d78724a7fcea6039909336177b8b26fec8fc47719e3e56ca9839dbaf52f9a4fec84d4717	tzcode2018e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2019-July/000056.html
+sha512 bcfb417fe3b7c39e702da0090291db0489744f733010ae183007fce5e441bfce885fb25ed11730cf7f363572e107d7ff0c4b38691bb99def2d8cf7017c05720f tzcode2019b.tar.gz
+# Locally computed:
+sha512 0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 224b7ab407..6f3d9d80ac 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2018e
+ZIC_VERSION = 2019b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
-ZIC_SITE = http://www.iana.org/time-zones/repository/releases
+ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
+ZIC_LICENSE_FILES = LICENSE
 
 define HOST_ZIC_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
-- 
2.20.1
