From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:49:35 +0200
Subject: [Buildroot] [git commit] package/iperf3: bump to version 3.8.1
Message-ID: <20200618194819.48D9885FA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9789f7116e6805008feae0c5f11dd642de68734e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't pass --disable-profiling, profiling is now disabled by default,
and in fact due to a bug in the configure.ac script, passing
--disable-profiling enables profiling.

Update LICENSE hash; copyright year update.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iperf3/iperf3.hash | 6 +++---
 package/iperf3/iperf3.mk   | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 2e6cfd5ab9..5f1c200f55 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.7.tar.gz.sha256
-sha256	d846040224317caf2f75c843d309a950a7db23f9b44b94688ccbe557d6d1710c  iperf-3.7.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.8.1.tar.gz.sha256
+sha256	e5b080f3273a8a715a4100f13826ac2ca31cc7b1315925631b2ecf64957ded96  iperf-3.8.1.tar.gz
 # Locally computed
-sha256	ee58f1e69139d39cfb055df15fe84453a379936dd45e44dbebf26c78afa3f5d4  LICENSE
+sha256	9ef73096bdd5209dd979bfa1fec70aeb42a7255d2df3aec423642aa92d5e9f40  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 3537b23824..7d5a10cdef 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.7
+IPERF3_VERSION = 3.8.1
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
@@ -12,8 +12,6 @@ IPERF3_LICENSE_FILES = LICENSE
 
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-IPERF3_CONF_OPTS += --disable-profiling
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # We intentionally don't pass --with-openssl, otherwise pkg-config is
 # not used, and indirect libraries are not picked up when static
