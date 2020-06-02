From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  2 Jun 2020 07:03:36 -0500
Subject: [Buildroot] [PATCH] package/ethtool: bump to 5.6
Message-ID: <20200602120336.19091-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * New dependency was added on libmnl (netlink library)
 * Now requires an updated pkg-config

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/ethtool/Config.in    | 1 +
 package/ethtool/ethtool.hash | 6 +++---
 package/ethtool/ethtool.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/ethtool/Config.in b/package/ethtool/Config.in
index 48173bfe2e..264b7b99c0 100644
--- a/package/ethtool/Config.in
+++ b/package/ethtool/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ETHTOOL
 	bool "ethtool"
+	select BR2_PACKAGE_LIBMNL
 	help
 	  ethtool is a small utility for examining and tuning your
 	  ethernet-based network interface.
diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 86c71d7380..67fe263315 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	22f81e4927d6eb6a13a259d705248a96005fce2005e15257f639f5a1c8c52b6b	ethtool-5.4.tar.xz
+sha256  ca0f1b526dad5153f0aa0f1eb3c17c31770c75a74f70af622b1a83ae38043995  ethtool-5.6.tar.xz
 # Locally calculated
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1	LICENSE
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index ce4f2d862d..70471d8ad6 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.4
+ETHTOOL_VERSION = 5.6
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
+ETHTOOL_DEPENDENCIES = host-pkgconf libmnl
 ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = LICENSE COPYING
 ETHTOOL_CONF_OPTS = \
-- 
2.17.1
