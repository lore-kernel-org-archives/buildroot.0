From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:56:37 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/timescaledb: bump
 version to 2.0.2
Message-ID: <20210426125912.5F49D86340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=554e352fe408fbe6945a52b2ed91834b2acc4493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Bugfix release with important bugfixes:
https://github.com/timescale/timescaledb/releases/tag/2.0.2

This maintenance release contains bugfixes since the 2.0.1 release. We
deem it high priority for upgrading.

The bug fixes in this release address issues with joins, the status of
background jobs, and disabling compression. It also includes
enhancements to continuous aggregates, including improved validation
of policies and optimizations for faster refreshes when there are a
lot of invalidations.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index f275c3d4b0..dfde3b51e7 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96e51d5240547f0223c34b91263f6fffca46927710764bf450aa61e9756189bd  timescaledb-2.0.1.tar.gz
+sha256  afb11b632455cfa593f60946125c8ed6ac0db4713c203d6582e662266f9e1045  timescaledb-2.0.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 0d5dc12d9d..08680f8909 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.0.1
+TIMESCALEDB_VERSION = 2.0.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
