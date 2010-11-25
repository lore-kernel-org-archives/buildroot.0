From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Nov 2010 09:19:21 +0100
Subject: [Buildroot] [git commit master 1/1] Cconfig: Add sparc-leon
	processors, remove deprecated v9 Sparc type.
Message-ID: <20101125090729.763588CA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fe629f97d84c1444e47152f73b4f3e1c1a3ec56d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the Sparc processor variants hfleon (fpu,v9), hfleonv8 (fpu,v8),
sfleon (softfpu,v7) sfleonv8 (softfpu,v8) and tweak the existing ones.

Signed-off-by: Konrad Eisele <konrad@gaisler.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    2 ++
 target/Config.in.arch |   31 +++++++++++++++++++------------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 03e9513..e703a07 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,8 @@
 
 	Fixes all over the tree.
 
+	Add support for LEON Sparc architecture variants.
+
 	Updated/fixed packages: bash, bind, busybox, gpsd, libglib2,
 	libcurl, libmad, lrzsz, midori, module-init-tools, mtd-utils,
 	openssh, openssl, pciutils, php, qt, sqlite, sysstat, webkit,
diff --git a/target/Config.in.arch b/target/Config.in.arch
index e08ce5b..d828501 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -304,6 +304,14 @@ config BR2_sparc_cypress
 	bool "cypress"
 config BR2_sparc_v8
 	bool "v8"
+config BR2_sparc_sparchfleon
+	bool "hfleon"
+config BR2_sparc_sparchfleonv8
+	bool "hfleonv8"
+config BR2_sparc_sparcsfleon
+	bool "sfleon"
+config BR2_sparc_sparcsfleonv8
+	bool "sfleonv8"
 config BR2_sparc_supersparc
 	bool "supersparc"
 config BR2_sparc_sparclite
@@ -320,20 +328,13 @@ config BR2_sparc_sparclet
 	bool "sparclet"
 config BR2_sparc_tsc701
 	bool "tsc701"
-config BR2_sparc_v9
-	bool "v9"
-config BR2_sparc_v9a
-	bool "v9a"
-config BR2_sparc_v9b
-	bool "v9b"
-config BR2_sparc_ultrasparc
-	bool "ultrasparc"
-config BR2_sparc_ultrasparc3
-	bool "ultrasparc3"
-config BR2_sparc_niagara
-	bool "niagara"
 endchoice
 
+config BR2_SPARC_TYPE
+	string
+	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
+	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_xtensa
@@ -666,3 +667,9 @@ config BR2_GCC_TARGET_ABI
 	default ibmlongdouble	if BR2_powerpc && BR2_PPC_ABI_ibmlongdouble
 	default ieeelongdouble	if BR2_powerpc && BR2_PPC_ABI_ieeelongdouble
 
+config BR2_GCC_TARGET_CPU
+	string
+	default sparchfleon	if BR2_sparc_sparchfleon
+	default sparchfleonv8	if BR2_sparc_sparchfleonv8
+	default sparcsfleon	if BR2_sparc_sparcsfleon
+	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
-- 
1.7.2.2
