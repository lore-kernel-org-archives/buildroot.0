From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 27 Jun 2018 21:29:31 +0300
Subject: [Buildroot] [PATCH] toolchain: bump ARC prebuild toolchain to
 arc-2018.03
Message-ID: <20180627182931.26354-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lets update prebuilt ARC toolchain to the most recent arc-2018.03.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 .../toolchain-external-synopsys-arc/Config.in          |  4 ++--
 .../toolchain-external-synopsys-arc.hash               | 10 +++++-----
 .../toolchain-external-synopsys-arc.mk                 |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index fefbb47b1e..423e4c7db3 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2017.09 toolchain"
+	bool "Synopsys ARC 2018.03 toolchain"
 	depends on BR2_arc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64"
@@ -11,7 +11,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Toolchain for the ARC cores, from
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
index 3479e18c6d..df95897e41 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
@@ -1,5 +1,5 @@
-# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.09-release
-sha256 ef74a7567a7341bc5e5d7bf6bcff64c2515be175d08a7def52df847583080ac2  arc_gnu_2017.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 8a7620dd7500641de40adb2ae490d90d53fcad01d13f77ba305fc00df32a26e3  arc_gnu_2017.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 ef7afba0da38cc08d863850f4987ebd16c71c8920c51990f490ad79389f102c1  arc_gnu_2017.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 eab1d4872298008bd141104368ec0b7873af600a09704827f767ae57b067c874  arc_gnu_2017.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
+# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2018.03-release
+sha256 32e8500b65737b51058d84f443d7919d5b33c43f7dc5b8562e08d4e92c53a77f  arc_gnu_2018.03_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256 722e3656f60bafd632b6f2ae2c6efa6b9d3eae1bc1840f4d004aa30f5cb419ff  arc_gnu_2018.03_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256 8e736178343cea9a6cbe63a7d86fa9e81db6671f27fc8a9a7cea98cc6183bbcc  arc_gnu_2018.03_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256 14024daa36f6ae7cf1e474780687e79af5aaa35d374b077f7036685d7eab3d72  arc_gnu_2018.03_prebuilt_uclibc_be_archs_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
index d751934c11..c60f296a89 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2017.09
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2018.03
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
 
 ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
-- 
2.17.1
