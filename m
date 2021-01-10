From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2021 17:47:11 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2020f
In-Reply-To: <20210110164711.1708062-1-bernd.kuhls@t-online.de>
References: <20210110164711.1708062-1-bernd.kuhls@t-online.de>
Message-ID: <20210110164711.1708062-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html

Upstream removed timezones pacificnew and systemv:
https://mm.icann.org/pipermail/tz-announce/2020-October/000059.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 8f0a9050fc..6a1ccc128d 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2020-April/000058.html
-sha512  2a2fc2e3ad8a6e4c574242296c847ad582c2c1d86add9c556e65c812d19b9528522e3c4dddb5239017091825d2acc5a2ccaf21dc41b900b6c300ef4264cc5a9d  tzdata2020a.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html
+sha512  dd312def18c807452fda2e697514e2064c5f51ebdbedd0cfe6f231252c76ee5d4409f653b295ed5657b7d30b868690047fdb70a10942e69eaa40b77473e3f9ca  tzdata2020f.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 114d60195e..41c4971584 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2020a
+TZDATA_VERSION = 2020f
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
@@ -17,7 +17,7 @@ TZDATA_LICENSE_FILES = LICENSE
 # dependencies
 TZDATA_DEFAULT_ZONELIST = \
 	africa antarctica asia australasia europe northamerica \
-	southamerica pacificnew etcetera backward systemv factory
+	southamerica etcetera backward factory
 
 ifeq ($(call qstrip,$(BR2_TARGET_TZ_ZONELIST)),default)
 TZDATA_ZONELIST = $(TZDATA_DEFAULT_ZONELIST)
-- 
2.29.2
