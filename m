From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 10:07:14 +0100
Subject: [Buildroot] [git commit] toolchain: bump ARC prebuild toolchain to
 arc-2017.09
Message-ID: <20180109093030.9C87281364@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c208203618cfaf3e9dcbcc8c987f9927999c53ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There might be subtle differences between uClibc configuration
compared to Buildroot's one.

Native RPC now is disabled because uClinc-ng has removed it.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external-synopsys-arc/Config.in                  |  7 +++----
 .../toolchain-external-synopsys-arc.hash                       | 10 +++++-----
 .../toolchain-external-synopsys-arc.mk                         |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 8e4344a..fefbb47 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,19 +1,18 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2016.09 toolchain"
+	bool "Synopsys ARC 2017.09 toolchain"
 	depends on BR2_arc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Toolchain for the ARC cores, from
 	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
index c96f53b..3479e18 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
@@ -1,5 +1,5 @@
-# Locally calculated
-sha256 9123e35510cc9105e5f9468d5154e0093770d7c11ed771c1a595ecf813692baf  arc_gnu_2016.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 3140066cdbda2df7ed0fb60424bbd9db740fb25393928e733234b0bf65508df2  arc_gnu_2016.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 aa6edb2101b13df3ac59f8d8ccbcfba37a6f7882f0e03baa9d9883480dbed4e7  arc_gnu_2016.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 4de227bf73536a87784d88e5f10085b91ede62c76ef8fedf53b4bf2e215054cf  arc_gnu_2016.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
+# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.09-release
+sha256 ef74a7567a7341bc5e5d7bf6bcff64c2515be175d08a7def52df847583080ac2  arc_gnu_2017.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256 8a7620dd7500641de40adb2ae490d90d53fcad01d13f77ba305fc00df32a26e3  arc_gnu_2017.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256 ef7afba0da38cc08d863850f4987ebd16c71c8920c51990f490ad79389f102c1  arc_gnu_2017.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256 eab1d4872298008bd141104368ec0b7873af600a09704827f767ae57b067c874  arc_gnu_2017.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
index f4cb7b7..d751934 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2016.09
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2017.09
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
 
 ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
