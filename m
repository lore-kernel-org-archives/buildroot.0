From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 21:39:44 +0100
Subject: [Buildroot] [git commit] toolchain: bump ARC prebuild toolchain to
 arc-2018.09
Message-ID: <20181202071600.CD2EE803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=375e6dd5d1913dfef977564415898dd053a6e920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lets update prebuilt ARC toolchain to the most recent arc-2018.09.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-synopsys-arc/Config.in                  |  6 +++---
 .../toolchain-external-synopsys-arc.hash                       | 10 +++++-----
 .../toolchain-external-synopsys-arc.mk                         |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 423e4c7db3..5cb0ce2a3e 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2018.03 toolchain"
+	bool "Synopsys ARC 2018.09 toolchain"
 	depends on BR2_arc
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
@@ -12,7 +12,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	help
 	  Toolchain for the ARC cores, from
 	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
index df95897e41..20eac19caa 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
@@ -1,5 +1,5 @@
-# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2018.03-release
-sha256 32e8500b65737b51058d84f443d7919d5b33c43f7dc5b8562e08d4e92c53a77f  arc_gnu_2018.03_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 722e3656f60bafd632b6f2ae2c6efa6b9d3eae1bc1840f4d004aa30f5cb419ff  arc_gnu_2018.03_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 8e736178343cea9a6cbe63a7d86fa9e81db6671f27fc8a9a7cea98cc6183bbcc  arc_gnu_2018.03_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 14024daa36f6ae7cf1e474780687e79af5aaa35d374b077f7036685d7eab3d72  arc_gnu_2018.03_prebuilt_uclibc_be_archs_linux_install.tar.gz
+# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2018.09-release
+sha256 324b422eec3b9b36ea64c9e13167a4467fc13ab230eff34f2fa785039b460c16  arc_gnu_2018.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256 b0299ad9be0c300237789e5bf8e45d72bf040aab00c3718fbdb4160b75d2ed8f  arc_gnu_2018.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256 d1a4c039416b3da4d94ea066f861cc96ec60afec9c2bab1b2e937555b5e05238  arc_gnu_2018.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256 a519ed3686dc8e3c5f86646988d38647aa039f4af3204d9b7e84efa26cd37221  arc_gnu_2018.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
index c60f296a89..e3ff17ff7b 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2018.03
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2018.09
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
 
 ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
