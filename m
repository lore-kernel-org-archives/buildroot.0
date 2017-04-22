From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:47 -0400
Subject: [Buildroot] [PATCH v2 01/25] package configs: clean up indentation
	warnings
Message-ID: <20170422171811.1346-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gave warnings on indentation issues
on all of these Config files.  This patch cleans up all warnings
related to the indentation of the Config files in the package directory

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - No changes.
  
 package/b43-firmware/Config.in       |   8 +-
 package/binutils/Config.in.host      |  12 +-
 package/gcc/Config.in.host           | 156 +++++------
 package/gdb/Config.in.host           |  12 +-
 package/jquery-ui-themes/Config.in   |  96 +++----
 package/kodi/Config.in               | 100 +++----
 package/linux-headers/Config.in.host |  85 +++---
 package/lua/Config.in                |  12 +-
 package/uclibc/Config.in             |  28 +-
 package/x11r7/Config.in              | 526 ++++++++++++++++++-----------------
 10 files changed, 522 insertions(+), 513 deletions(-)

diff --git a/package/b43-firmware/Config.in b/package/b43-firmware/Config.in
index bc69bbc..7cef023 100644
--- a/package/b43-firmware/Config.in
+++ b/package/b43-firmware/Config.in
@@ -14,11 +14,11 @@ choice
 	  kernel >= 3.2 need a different firmware than the b43 drivers
 	  from kernel < 3.2.
 
-	config BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2
-		bool ">= 3.2"
+config BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2
+	bool ">= 3.2"
 
-	config BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2
-		bool "< 3.2"
+config BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2
+	bool "< 3.2"
 
 endchoice
 
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 308322a..cca71fb 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,14 +7,14 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_26_X
-		bool "binutils 2.26.1"
+config BR2_BINUTILS_VERSION_2_26_X
+	bool "binutils 2.26.1"
 
-	config BR2_BINUTILS_VERSION_2_27_X
-		bool "binutils 2.27"
+config BR2_BINUTILS_VERSION_2_27_X
+	bool "binutils 2.27"
 
-	config BR2_BINUTILS_VERSION_2_28_X
-		bool "binutils 2.28"
+config BR2_BINUTILS_VERSION_2_28_X
+	bool "binutils 2.28"
 
 endchoice
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 9cf4571..4bcb23e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -8,84 +8,84 @@ choice
 	help
 	  Select the version of gcc you wish to use.
 
-	config BR2_GCC_VERSION_4_8_X
-		bool "gcc 4.8.x"
-		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_arc && !BR2_or1k \
-			&& !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
-		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8
-		# Broken or unsupported PPC cores
-		depends on !BR2_powerpc_power8
-		# Unsupported MIPS cores
-		depends on !BR2_mips_interaptiv
-		# gcc-4.8.x + binutils-2.25 is broken for MIPS
-		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
-		# Unsupported for MIPS R5
-		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
-		# Unsupported for MIPS R6
-		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
-		# musl ppc64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-		# musl mips64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-	config BR2_GCC_VERSION_ARC
-		bool "gcc arc (6.x)"
-		# Only supported architecture
-		depends on BR2_arc
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-
-	config BR2_GCC_VERSION_OR1K
-		bool "gcc or1k (5.x)"
-		# Only supported architecture
-		depends on BR2_or1k
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-	config BR2_GCC_VERSION_4_9_X
-		bool "gcc 4.9.x"
-		# Broken or unsupported architectures
-		depends on !BR2_arc && !BR2_bfin && !BR2_or1k
-		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a17 && !BR2_cortex_a72
-		# Unsupported MIPS cores
-		depends on !BR2_mips_interaptiv
-		# Unsupported for MIPS R5
-		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
-		# Unsupported for MIPS R6
-		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
-		# musl microblaze unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
-		# musl ppc64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-		# musl mips64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-	config BR2_GCC_VERSION_5_X
-		bool "gcc 5.x"
-		# Broken or unsupported architectures
-		depends on !BR2_arc && !BR2_bfin && !BR2_or1k
-		# musl ppc64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
-		# Unsupported MIPS cores
-		depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
-			!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
-		# musl mips64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-	config BR2_GCC_VERSION_6_X
-		bool "gcc 6.x"
-		# Broken or unsupported architectures
-		depends on !BR2_arc
-		depends on !BR2_microblaze
-		depends on !BR2_or1k
-		# Unsupported MIPS cores
-		depends on !BR2_mips_m6250 && !BR2_mips_p6600
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+config BR2_GCC_VERSION_4_8_X
+	bool "gcc 4.8.x"
+	# Broken or unsupported architectures
+	depends on !BR2_microblaze && !BR2_arc && !BR2_or1k \
+		&& !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
+	# Broken or unsupported ARM cores
+	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8
+	# Broken or unsupported PPC cores
+	depends on !BR2_powerpc_power8
+	# Unsupported MIPS cores
+	depends on !BR2_mips_interaptiv
+	# gcc-4.8.x + binutils-2.25 is broken for MIPS
+	depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
+	# Unsupported for MIPS R5
+	depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
+	# Unsupported for MIPS R6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+	# musl ppc64 unsupported
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
+	# musl mips64 unsupported
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+config BR2_GCC_VERSION_ARC
+	bool "gcc arc (6.x)"
+	# Only supported architecture
+	depends on BR2_arc
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
+config BR2_GCC_VERSION_OR1K
+	bool "gcc or1k (5.x)"
+	# Only supported architecture
+	depends on BR2_or1k
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
+config BR2_GCC_VERSION_4_9_X
+	bool "gcc 4.9.x"
+	# Broken or unsupported architectures
+	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
+	# Broken or unsupported ARM cores
+	depends on !BR2_cortex_a17 && !BR2_cortex_a72
+	# Unsupported MIPS cores
+	depends on !BR2_mips_interaptiv
+	# Unsupported for MIPS R5
+	depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
+	# Unsupported for MIPS R6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+	# musl microblaze unsupported
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
+	# musl ppc64 unsupported
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
+	# musl mips64 unsupported
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
+	# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_GCC_VERSION_5_X
+	bool "gcc 5.x"
+	# Broken or unsupported architectures
+	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
+	# musl ppc64 unsupported
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
+	# Unsupported MIPS cores
+	depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
+		!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
+	# musl mips64 unsupported
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
+config BR2_GCC_VERSION_6_X
+	bool "gcc 6.x"
+	# Broken or unsupported architectures
+	depends on !BR2_arc
+	depends on !BR2_microblaze
+	depends on !BR2_or1k
+	# Unsupported MIPS cores
+	depends on !BR2_mips_m6250 && !BR2_mips_p6600
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 endchoice
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cbb157e..a059fdc 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -39,14 +39,14 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_7_10
-		bool "gdb 7.10.x"
+config BR2_GDB_VERSION_7_10
+	bool "gdb 7.10.x"
 
-	config BR2_GDB_VERSION_7_11
-		bool "gdb 7.11.x"
+config BR2_GDB_VERSION_7_11
+	bool "gdb 7.11.x"
 
-	config BR2_GDB_VERSION_7_12
-		bool "gdb 7.12.x"
+config BR2_GDB_VERSION_7_12
+	bool "gdb 7.12.x"
 
 endchoice
 
diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index a7ae11e..fde3014 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -13,77 +13,77 @@ choice
 	help
 	  Specify the jQuery UI theme to install.
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
-		bool "black-tie"
+config BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
+	bool "black-tie"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
-		bool "blitzer"
+config BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
+	bool "blitzer"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
-		bool "cupertino"
+config BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
+	bool "cupertino"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
-		bool "dark-hive"
+config BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
+	bool "dark-hive"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
-		bool "dot-luv"
+config BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
+	bool "dot-luv"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
-		bool "eggplant"
+config BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
+	bool "eggplant"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
-		bool "excite-bike"
+config BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
+	bool "excite-bike"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_FLICK
-		bool "flick"
+config BR2_PACKAGE_JQUERY_UI_THEME_FLICK
+	bool "flick"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
-		bool "hot-sneaks"
+config BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
+	bool "hot-sneaks"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
-		bool "humanity"
+config BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
+	bool "humanity"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
-		bool "le-frog"
+config BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
+	bool "le-frog"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
-		bool "mint-choc"
+config BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
+	bool "mint-choc"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
-		bool "overcast"
+config BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
+	bool "overcast"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
-		bool "pepper-grinder"
+config BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
+	bool "pepper-grinder"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
-		bool "redmond"
+config BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
+	bool "redmond"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
-		bool "smoothness"
+config BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
+	bool "smoothness"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
-		bool "south-street"
+config BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
+	bool "south-street"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_START
-		bool "start"
+config BR2_PACKAGE_JQUERY_UI_THEME_START
+	bool "start"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
-		bool "sunny"
+config BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
+	bool "sunny"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
-		bool "swanky-purse"
+config BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
+	bool "swanky-purse"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
-		bool "trontastic"
+config BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
+	bool "trontastic"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
-		bool "ui-darkness"
+config BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
+	bool "ui-darkness"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
-		bool "ui-lightness"
+config BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
+	bool "ui-lightness"
 
-	config BR2_PACKAGE_JQUERY_UI_THEME_VADER
-		bool "vader"
+config BR2_PACKAGE_JQUERY_UI_THEME_VADER
+	bool "vader"
 
 endchoice
 
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f2a3e2e..5b1b424 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -256,71 +256,71 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 	bool
 
 menu "Audio decoder addons"
-	source "package/kodi-audiodecoder-modplug/Config.in"
-	source "package/kodi-audiodecoder-nosefart/Config.in"
-	source "package/kodi-audiodecoder-opus/Config.in"
-	source "package/kodi-audiodecoder-sidplay/Config.in"
-	source "package/kodi-audiodecoder-snesapu/Config.in"
-	source "package/kodi-audiodecoder-stsound/Config.in"
-	source "package/kodi-audiodecoder-timidity/Config.in"
-	source "package/kodi-audiodecoder-vgmstream/Config.in"
+source "package/kodi-audiodecoder-modplug/Config.in"
+source "package/kodi-audiodecoder-nosefart/Config.in"
+source "package/kodi-audiodecoder-opus/Config.in"
+source "package/kodi-audiodecoder-sidplay/Config.in"
+source "package/kodi-audiodecoder-snesapu/Config.in"
+source "package/kodi-audiodecoder-stsound/Config.in"
+source "package/kodi-audiodecoder-timidity/Config.in"
+source "package/kodi-audiodecoder-vgmstream/Config.in"
 endmenu
 
 menu "Audio DSP addons"
-	source "package/kodi-adsp-basic/Config.in"
-	source "package/kodi-adsp-freesurround/Config.in"
+source "package/kodi-adsp-basic/Config.in"
+source "package/kodi-adsp-freesurround/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-	source "package/kodi-audioencoder-flac/Config.in"
-	source "package/kodi-audioencoder-lame/Config.in"
-	source "package/kodi-audioencoder-vorbis/Config.in"
-	source "package/kodi-audioencoder-wav/Config.in"
+source "package/kodi-audioencoder-flac/Config.in"
+source "package/kodi-audioencoder-lame/Config.in"
+source "package/kodi-audioencoder-vorbis/Config.in"
+source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
 menu "PVR addons"
-	source "package/kodi-pvr-argustv/Config.in"
-	source "package/kodi-pvr-dvblink/Config.in"
-	source "package/kodi-pvr-dvbviewer/Config.in"
-	source "package/kodi-pvr-filmon/Config.in"
-	source "package/kodi-pvr-hdhomerun/Config.in"
-	source "package/kodi-pvr-hts/Config.in"
-	source "package/kodi-pvr-iptvsimple/Config.in"
-	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
-	source "package/kodi-pvr-mythtv/Config.in"
-	source "package/kodi-pvr-nextpvr/Config.in"
-	source "package/kodi-pvr-njoy/Config.in"
-	source "package/kodi-pvr-pctv/Config.in"
-	source "package/kodi-pvr-stalker/Config.in"
-	source "package/kodi-pvr-vbox/Config.in"
-	source "package/kodi-pvr-vdr-vnsi/Config.in"
-	source "package/kodi-pvr-vuplus/Config.in"
-	source "package/kodi-pvr-wmc/Config.in"
+source "package/kodi-pvr-argustv/Config.in"
+source "package/kodi-pvr-dvblink/Config.in"
+source "package/kodi-pvr-dvbviewer/Config.in"
+source "package/kodi-pvr-filmon/Config.in"
+source "package/kodi-pvr-hdhomerun/Config.in"
+source "package/kodi-pvr-hts/Config.in"
+source "package/kodi-pvr-iptvsimple/Config.in"
+source "package/kodi-pvr-mediaportal-tvserver/Config.in"
+source "package/kodi-pvr-mythtv/Config.in"
+source "package/kodi-pvr-nextpvr/Config.in"
+source "package/kodi-pvr-njoy/Config.in"
+source "package/kodi-pvr-pctv/Config.in"
+source "package/kodi-pvr-stalker/Config.in"
+source "package/kodi-pvr-vbox/Config.in"
+source "package/kodi-pvr-vdr-vnsi/Config.in"
+source "package/kodi-pvr-vuplus/Config.in"
+source "package/kodi-pvr-wmc/Config.in"
 endmenu
 
 menu "Screensavers"
-	source "package/kodi-screensaver-asteroids/Config.in"
-	source "package/kodi-screensaver-asterwave/Config.in"
-	source "package/kodi-screensaver-biogenesis/Config.in"
-	source "package/kodi-screensaver-cpblobs/Config.in"
-	source "package/kodi-screensaver-crystalmorph/Config.in"
-	source "package/kodi-screensaver-greynetic/Config.in"
-	source "package/kodi-screensaver-matrixtrails/Config.in"
-	source "package/kodi-screensaver-pingpong/Config.in"
-	source "package/kodi-screensaver-planestate/Config.in"
-	source "package/kodi-screensaver-pyro/Config.in"
-	source "package/kodi-screensaver-rsxs/Config.in"
-	source "package/kodi-screensaver-stars/Config.in"
+source "package/kodi-screensaver-asteroids/Config.in"
+source "package/kodi-screensaver-asterwave/Config.in"
+source "package/kodi-screensaver-biogenesis/Config.in"
+source "package/kodi-screensaver-cpblobs/Config.in"
+source "package/kodi-screensaver-crystalmorph/Config.in"
+source "package/kodi-screensaver-greynetic/Config.in"
+source "package/kodi-screensaver-matrixtrails/Config.in"
+source "package/kodi-screensaver-pingpong/Config.in"
+source "package/kodi-screensaver-planestate/Config.in"
+source "package/kodi-screensaver-pyro/Config.in"
+source "package/kodi-screensaver-rsxs/Config.in"
+source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
 menu "Visualisations"
-	source "package/kodi-visualisation-fishbmc/Config.in"
-	source "package/kodi-visualisation-fountain/Config.in"
-	source "package/kodi-visualisation-goom/Config.in"
-	source "package/kodi-visualisation-shadertoy/Config.in"
-	source "package/kodi-visualisation-spectrum/Config.in"
-	source "package/kodi-visualisation-waveforhue/Config.in"
-	source "package/kodi-visualisation-waveform/Config.in"
+source "package/kodi-visualisation-fishbmc/Config.in"
+source "package/kodi-visualisation-fountain/Config.in"
+source "package/kodi-visualisation-goom/Config.in"
+source "package/kodi-visualisation-shadertoy/Config.in"
+source "package/kodi-visualisation-spectrum/Config.in"
+source "package/kodi-visualisation-waveforhue/Config.in"
+source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7a62442..7bfa5d4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -22,48 +22,49 @@ choice
 	  or hide packages that have strong requirements on the kernel
 	  headers.
 
-	config BR2_KERNEL_HEADERS_AS_KERNEL
-		bool "Same as kernel being built"
-		depends on BR2_LINUX_KERNEL
-
-	config BR2_KERNEL_HEADERS_3_2
-		bool "Linux 3.2.x kernel headers"
-		depends on !BR2_arc && !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-
-	config BR2_KERNEL_HEADERS_3_4
-		bool "Linux 3.4.x kernel headers"
-		depends on !BR2_arc && !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-
-	config BR2_KERNEL_HEADERS_3_10
-		bool "Linux 3.10.x kernel headers"
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-
-	config BR2_KERNEL_HEADERS_3_12
-		bool "Linux 3.12.x kernel headers"
-		depends on !BR2_nios2
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-
-	config BR2_KERNEL_HEADERS_4_1
-		bool "Linux 4.1.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
-
-	config BR2_KERNEL_HEADERS_4_4
-		bool "Linux 4.4.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-
-	config BR2_KERNEL_HEADERS_4_9
-		bool "Linux 4.9.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
-
-	config BR2_KERNEL_HEADERS_4_10
-		bool "Linux 4.10.x kernel headers"
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-
-	config BR2_KERNEL_HEADERS_VERSION
-		bool "Manually specified Linux version"
+config BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Same as kernel being built"
+	depends on BR2_LINUX_KERNEL
+
+config BR2_KERNEL_HEADERS_3_2
+	bool "Linux 3.2.x kernel headers"
+	depends on !BR2_arc && !BR2_nios2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+
+config BR2_KERNEL_HEADERS_3_4
+	bool "Linux 3.4.x kernel headers"
+	depends on !BR2_arc && !BR2_nios2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
+config BR2_KERNEL_HEADERS_3_10
+	bool "Linux 3.10.x kernel headers"
+	depends on !BR2_nios2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
+config BR2_KERNEL_HEADERS_3_12
+	bool "Linux 3.12.x kernel headers"
+	depends on !BR2_nios2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_KERNEL_HEADERS_4_1
+	bool "Linux 4.1.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
+
+config BR2_KERNEL_HEADERS_4_4
+	bool "Linux 4.4.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+
+config BR2_KERNEL_HEADERS_4_9
+	bool "Linux 4.9.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+
+config BR2_KERNEL_HEADERS_4_10
+	bool "Linux 4.10.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
+config BR2_KERNEL_HEADERS_VERSION
+	bool "Manually specified Linux version"
+
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 711fa89..35910cb 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -17,14 +17,14 @@ choice
 	help
 	  Select the version of Lua API/ABI you wish to use.
 
-	config BR2_PACKAGE_LUA_5_1
-		bool "Lua 5.1.x"
+config BR2_PACKAGE_LUA_5_1
+	bool "Lua 5.1.x"
 
-	config BR2_PACKAGE_LUA_5_2
-		bool "Lua 5.2.x"
+config BR2_PACKAGE_LUA_5_2
+	bool "Lua 5.2.x"
 
-	config BR2_PACKAGE_LUA_5_3
-		bool "Lua 5.3.x"
+config BR2_PACKAGE_LUA_5_3
+	bool "Lua 5.3.x"
 
 endchoice
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 28d2bcc..bfce45c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -45,20 +45,20 @@ choice
 	  Use this option to select the thread library implementation
 	  that should be used in your toolchain.
 
-	config BR2_PTHREADS_NATIVE
-		bool "Native POSIX Threading (NPTL)"
-		select BR2_TOOLCHAIN_HAS_THREADS
-		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-		depends on BR2_USE_MMU
-		depends on !BR2_m68k && !BR2_microblaze && !BR2_or1k
-
-	config BR2_PTHREADS
-		bool "linuxthreads"
-		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
-
-	config BR2_PTHREADS_NONE
-		bool "none"
+config BR2_PTHREADS_NATIVE
+	bool "Native POSIX Threading (NPTL)"
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU
+	depends on !BR2_m68k && !BR2_microblaze && !BR2_or1k
+
+config BR2_PTHREADS
+	bool "linuxthreads"
+	select BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
+
+config BR2_PTHREADS_NONE
+	bool "none"
 
 endchoice
 
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index ddceaa4..3a98b9b 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -10,265 +10,273 @@ menuconfig BR2_PACKAGE_XORG7
 	  http://xorg.freedesktop.org
 
 if BR2_PACKAGE_XORG7
-	menu "X11R7 Servers"
-		source package/x11r7/xserver_xorg-server/Config.in
-	endmenu
-	menu "X11R7 Libraries"
-		source package/x11r7/libxcb/Config.in
-		source package/x11r7/xcb-util/Config.in
-		source package/x11r7/xcb-util-cursor/Config.in
-		source package/x11r7/xcb-util-image/Config.in
-		source package/x11r7/xcb-util-keysyms/Config.in
-		source package/x11r7/xcb-util-renderutil/Config.in
-		source package/x11r7/xcb-util-wm/Config.in
-		source package/x11r7/xlib_libFS/Config.in
-		source package/x11r7/xlib_libICE/Config.in
-		source package/x11r7/xlib_libSM/Config.in
-		source package/x11r7/xlib_libX11/Config.in
-		source package/x11r7/xlib_libXScrnSaver/Config.in
-		source package/x11r7/xlib_libXau/Config.in
-		source package/x11r7/xlib_libXaw/Config.in
-		source package/x11r7/xlib_libXcomposite/Config.in
-		source package/x11r7/xlib_libXcursor/Config.in
-		source package/x11r7/xlib_libXdamage/Config.in
-		source package/x11r7/xlib_libXdmcp/Config.in
-		source package/x11r7/xlib_libXext/Config.in
-		source package/x11r7/xlib_libXfixes/Config.in
-		source package/x11r7/xlib_libXfont/Config.in
-		source package/x11r7/xlib_libXfont2/Config.in
-		source package/x11r7/xlib_libXft/Config.in
-		source package/x11r7/xlib_libXi/Config.in
-		source package/x11r7/xlib_libXinerama/Config.in
-		source package/x11r7/xlib_libXmu/Config.in
-		source package/x11r7/xlib_libXpm/Config.in
-		source package/x11r7/xlib_libXrandr/Config.in
-		source package/x11r7/xlib_libXrender/Config.in
-		source package/x11r7/xlib_libXres/Config.in
-		source package/x11r7/xlib_libXt/Config.in
-		source package/x11r7/xlib_libXtst/Config.in
-		source package/x11r7/xlib_libXv/Config.in
-		source package/x11r7/xlib_libXvMC/Config.in
-		source package/x11r7/xlib_libXxf86dga/Config.in
-		source package/x11r7/xlib_libXxf86vm/Config.in
-		source package/x11r7/xlib_libdmx/Config.in
-		source package/x11r7/xlib_libfontenc/Config.in
-		source package/x11r7/xlib_libxkbfile/Config.in
-		source package/x11r7/xlib_libxshmfence/Config.in
-		source package/x11r7/xlib_xtrans/Config.in
-	endmenu
-	menu "X11R7 Applications"
-		source package/x11r7/xapp_appres/Config.in
-		source package/x11r7/xapp_bdftopcf/Config.in
-		source package/x11r7/xapp_beforelight/Config.in
-		source package/x11r7/xapp_bitmap/Config.in
-		source package/x11r7/xapp_editres/Config.in
-		source package/x11r7/xapp_fonttosfnt/Config.in
-		source package/x11r7/xapp_fslsfonts/Config.in
-		source package/x11r7/xapp_fstobdf/Config.in
-		source package/x11r7/xapp_iceauth/Config.in
-		source package/x11r7/xapp_ico/Config.in
-		source package/x11r7/xapp_listres/Config.in
-		source package/x11r7/xapp_luit/Config.in
-		source package/x11r7/xapp_mkfontdir/Config.in
-		source package/x11r7/xapp_mkfontscale/Config.in
-		source package/x11r7/xapp_oclock/Config.in
-		source package/x11r7/xapp_rgb/Config.in
-		source package/x11r7/xapp_rstart/Config.in
-		source package/x11r7/xapp_scripts/Config.in
-		source package/x11r7/xapp_sessreg/Config.in
-		source package/x11r7/xapp_setxkbmap/Config.in
-		source package/x11r7/xapp_showfont/Config.in
-		source package/x11r7/xapp_smproxy/Config.in
-		source package/x11r7/xapp_twm/Config.in
-		source package/x11r7/xapp_viewres/Config.in
-		source package/x11r7/xapp_x11perf/Config.in
-		source package/x11r7/xapp_xauth/Config.in
-		source package/x11r7/xapp_xbacklight/Config.in
-		source package/x11r7/xapp_xbiff/Config.in
-		source package/x11r7/xapp_xcalc/Config.in
-		source package/x11r7/xapp_xclipboard/Config.in
-		source package/x11r7/xapp_xclock/Config.in
-		source package/x11r7/xapp_xcmsdb/Config.in
-		source package/x11r7/xapp_xcompmgr/Config.in
-		source package/x11r7/xapp_xconsole/Config.in
-		source package/x11r7/xapp_xcursorgen/Config.in
-		source package/x11r7/xapp_xdbedizzy/Config.in
-		source package/x11r7/xapp_xditview/Config.in
-		source package/x11r7/xapp_xdm/Config.in
-		source package/x11r7/xapp_xdpyinfo/Config.in
-		source package/x11r7/xapp_xdriinfo/Config.in
-		source package/x11r7/xapp_xedit/Config.in
-		source package/x11r7/xapp_xev/Config.in
-		source package/x11r7/xapp_xeyes/Config.in
-		source package/x11r7/xapp_xf86dga/Config.in
-		source package/x11r7/xapp_xfd/Config.in
-		source package/x11r7/xapp_xfindproxy/Config.in
-		source package/x11r7/xapp_xfontsel/Config.in
-		source package/x11r7/xapp_xfs/Config.in
-		source package/x11r7/xapp_xfsinfo/Config.in
-		source package/x11r7/xapp_xgamma/Config.in
-		source package/x11r7/xapp_xgc/Config.in
-		source package/x11r7/xapp_xhost/Config.in
-		source package/x11r7/xapp_xinit/Config.in
-		source package/x11r7/xapp_xinput/Config.in
-		source package/x11r7/xapp_xinput-calibrator/Config.in
-		source package/x11r7/xapp_xkbcomp/Config.in
-		source package/x11r7/xapp_xkbevd/Config.in
-		source package/x11r7/xapp_xkbprint/Config.in
-		source package/x11r7/xapp_xkbutils/Config.in
-		source package/x11r7/xapp_xkill/Config.in
-		source package/x11r7/xapp_xload/Config.in
-		source package/x11r7/xapp_xlogo/Config.in
-		source package/x11r7/xapp_xlsatoms/Config.in
-		source package/x11r7/xapp_xlsclients/Config.in
-		source package/x11r7/xapp_xlsfonts/Config.in
-		source package/x11r7/xapp_xmag/Config.in
-		source package/x11r7/xapp_xman/Config.in
-		source package/x11r7/xapp_xmessage/Config.in
-		source package/x11r7/xapp_xmh/Config.in
-		source package/x11r7/xapp_xmodmap/Config.in
-		source package/x11r7/xapp_xmore/Config.in
-		source package/x11r7/xapp_xpr/Config.in
-		source package/x11r7/xapp_xprop/Config.in
-		source package/x11r7/xapp_xrandr/Config.in
-		source package/x11r7/xapp_xrdb/Config.in
-		source package/x11r7/xapp_xrefresh/Config.in
-		source package/x11r7/xapp_xset/Config.in
-		source package/x11r7/xapp_xsetmode/Config.in
-		source package/x11r7/xapp_xsetpointer/Config.in
-		source package/x11r7/xapp_xsetroot/Config.in
-		source package/x11r7/xapp_xsm/Config.in
-		source package/x11r7/xapp_xstdcmap/Config.in
-		source package/x11r7/xapp_xvidtune/Config.in
-		source package/x11r7/xapp_xvinfo/Config.in
-		source package/x11r7/xapp_xwd/Config.in
-		source package/x11r7/xapp_xwininfo/Config.in
-		source package/x11r7/xapp_xwud/Config.in
-	endmenu
-	if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
-	menu "X11R7 Drivers"
-		source package/x11r7/xdriver_xf86-input-evdev/Config.in
-		source package/x11r7/xdriver_xf86-input-joystick/Config.in
-		source package/x11r7/xdriver_xf86-input-keyboard/Config.in
-		source package/x11r7/xdriver_xf86-input-libinput/Config.in
-		source package/x11r7/xdriver_xf86-input-mouse/Config.in
-		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
-		source package/x11r7/xdriver_xf86-input-tslib/Config.in
-		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
-		source package/x11r7/xdriver_xf86-video-amdgpu/Config.in
-		source package/x11r7/xdriver_xf86-video-ark/Config.in
-		source package/x11r7/xdriver_xf86-video-ast/Config.in
-		source package/x11r7/xdriver_xf86-video-ati/Config.in
-		source package/x11r7/xdriver_xf86-video-cirrus/Config.in
-		source package/x11r7/xdriver_xf86-video-dummy/Config.in
-		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
-		source package/x11r7/xdriver_xf86-video-fbturbo/Config.in
-		source package/x11r7/xdriver_xf86-video-geode/Config.in
-		source package/x11r7/xdriver_xf86-video-glint/Config.in
-		source package/x11r7/xdriver_xf86-video-i128/Config.in
-		source package/x11r7/xdriver_xf86-video-imx/Config.in
-		source package/x11r7/xdriver_xf86-video-imx-viv/Config.in
-		source package/x11r7/xdriver_xf86-video-intel/Config.in
-		source package/x11r7/xdriver_xf86-video-mach64/Config.in
-		source package/x11r7/xdriver_xf86-video-mga/Config.in
-		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
-		source package/x11r7/xdriver_xf86-video-nouveau/Config.in
-		source package/x11r7/xdriver_xf86-video-nv/Config.in
-		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
-		source package/x11r7/xdriver_xf86-video-qxl/Config.in
-		source package/x11r7/xdriver_xf86-video-r128/Config.in
-		source package/x11r7/xdriver_xf86-video-savage/Config.in
-		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
-		source package/x11r7/xdriver_xf86-video-sis/Config.in
-		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
-		source package/x11r7/xdriver_xf86-video-tga/Config.in
-		source package/x11r7/xdriver_xf86-video-trident/Config.in
-		source package/x11r7/xdriver_xf86-video-vesa/Config.in
-		source package/x11r7/xdriver_xf86-video-vmware/Config.in
-		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
-	endmenu
-	endif
-	menu "X11R7 Fonts"
-		source package/x11r7/xfont_font-util/Config.in
-		source package/x11r7/xfont_encodings/Config.in
-		source package/x11r7/xfont_font-adobe-100dpi/Config.in
-		source package/x11r7/xfont_font-adobe-75dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-type1/Config.in
-		source package/x11r7/xfont_font-alias/Config.in
-		source package/x11r7/xfont_font-arabic-misc/Config.in
-		source package/x11r7/xfont_font-bh-100dpi/Config.in
-		source package/x11r7/xfont_font-bh-75dpi/Config.in
-		source package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
-		source package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
-		source package/x11r7/xfont_font-bh-ttf/Config.in
-		source package/x11r7/xfont_font-bh-type1/Config.in
-		source package/x11r7/xfont_font-bitstream-100dpi/Config.in
-		source package/x11r7/xfont_font-bitstream-75dpi/Config.in
-		source package/x11r7/xfont_font-bitstream-type1/Config.in
-		source package/x11r7/xfont_font-cronyx-cyrillic/Config.in
-		source package/x11r7/xfont_font-cursor-misc/Config.in
-		source package/x11r7/xfont_font-daewoo-misc/Config.in
-		source package/x11r7/xfont_font-dec-misc/Config.in
-		source package/x11r7/xfont_font-ibm-type1/Config.in
-		source package/x11r7/xfont_font-isas-misc/Config.in
-		source package/x11r7/xfont_font-jis-misc/Config.in
-		source package/x11r7/xfont_font-micro-misc/Config.in
-		source package/x11r7/xfont_font-misc-cyrillic/Config.in
-		source package/x11r7/xfont_font-misc-ethiopic/Config.in
-		source package/x11r7/xfont_font-misc-meltho/Config.in
-		source package/x11r7/xfont_font-misc-misc/Config.in
-		source package/x11r7/xfont_font-mutt-misc/Config.in
-		source package/x11r7/xfont_font-schumacher-misc/Config.in
-		source package/x11r7/xfont_font-screen-cyrillic/Config.in
-		source package/x11r7/xfont_font-sony-misc/Config.in
-		source package/x11r7/xfont_font-sun-misc/Config.in
-		source package/x11r7/xfont_font-winitzki-cyrillic/Config.in
-		source package/x11r7/xfont_font-xfree86-type1/Config.in
-	endmenu
-	menu "X11R7 X protocols"
-		source package/x11r7/xcb-proto/Config.in
-		source package/x11r7/xproto_applewmproto/Config.in
-		source package/x11r7/xproto_bigreqsproto/Config.in
-		source package/x11r7/xproto_compositeproto/Config.in
-		source package/x11r7/xproto_damageproto/Config.in
-		source package/x11r7/xproto_dmxproto/Config.in
-		source package/x11r7/xproto_dri2proto/Config.in
-		source package/x11r7/xproto_dri3proto/Config.in
-		source package/x11r7/xproto_fixesproto/Config.in
-		source package/x11r7/xproto_fontcacheproto/Config.in
-		source package/x11r7/xproto_fontsproto/Config.in
-		source package/x11r7/xproto_glproto/Config.in
-		source package/x11r7/xproto_inputproto/Config.in
-		source package/x11r7/xproto_kbproto/Config.in
-		source package/x11r7/xproto_presentproto/Config.in
-		source package/x11r7/xproto_randrproto/Config.in
-		source package/x11r7/xproto_recordproto/Config.in
-		source package/x11r7/xproto_renderproto/Config.in
-		source package/x11r7/xproto_resourceproto/Config.in
-		source package/x11r7/xproto_scrnsaverproto/Config.in
-		source package/x11r7/xproto_videoproto/Config.in
-		source package/x11r7/xproto_windowswmproto/Config.in
-		source package/x11r7/xproto_xcmiscproto/Config.in
-		source package/x11r7/xproto_xextproto/Config.in
-		source package/x11r7/xproto_xf86bigfontproto/Config.in
-		source package/x11r7/xproto_xf86dgaproto/Config.in
-		source package/x11r7/xproto_xf86driproto/Config.in
-		source package/x11r7/xproto_xf86vidmodeproto/Config.in
-		source package/x11r7/xproto_xineramaproto/Config.in
-		source package/x11r7/xproto_xproto/Config.in
-		source package/x11r7/xproto_xproxymanagementprotocol/Config.in
-	endmenu
-	menu "X11R7 Utilities"
-		source package/x11r7/xutil_makedepend/Config.in
-		source package/x11r7/mcookie/Config.in
-	endmenu
-	menu "X11R7 Other data"
-		source package/x11r7/xdata_xbitmaps/Config.in
-		source package/x11r7/xdata_xcursor-themes/Config.in
-		source package/x11r7/xcursor-transparent-theme/Config.in
-	endmenu
+menu "X11R7 Servers"
+source package/x11r7/xserver_xorg-server/Config.in
+endmenu
+
+menu "X11R7 Libraries"
+source package/x11r7/libxcb/Config.in
+source package/x11r7/xcb-util/Config.in
+source package/x11r7/xcb-util-cursor/Config.in
+source package/x11r7/xcb-util-image/Config.in
+source package/x11r7/xcb-util-keysyms/Config.in
+source package/x11r7/xcb-util-renderutil/Config.in
+source package/x11r7/xcb-util-wm/Config.in
+source package/x11r7/xlib_libFS/Config.in
+source package/x11r7/xlib_libICE/Config.in
+source package/x11r7/xlib_libSM/Config.in
+source package/x11r7/xlib_libX11/Config.in
+source package/x11r7/xlib_libXScrnSaver/Config.in
+source package/x11r7/xlib_libXau/Config.in
+source package/x11r7/xlib_libXaw/Config.in
+source package/x11r7/xlib_libXcomposite/Config.in
+source package/x11r7/xlib_libXcursor/Config.in
+source package/x11r7/xlib_libXdamage/Config.in
+source package/x11r7/xlib_libXdmcp/Config.in
+source package/x11r7/xlib_libXext/Config.in
+source package/x11r7/xlib_libXfixes/Config.in
+source package/x11r7/xlib_libXfont/Config.in
+source package/x11r7/xlib_libXfont2/Config.in
+source package/x11r7/xlib_libXft/Config.in
+source package/x11r7/xlib_libXi/Config.in
+source package/x11r7/xlib_libXinerama/Config.in
+source package/x11r7/xlib_libXmu/Config.in
+source package/x11r7/xlib_libXpm/Config.in
+source package/x11r7/xlib_libXrandr/Config.in
+source package/x11r7/xlib_libXrender/Config.in
+source package/x11r7/xlib_libXres/Config.in
+source package/x11r7/xlib_libXt/Config.in
+source package/x11r7/xlib_libXtst/Config.in
+source package/x11r7/xlib_libXv/Config.in
+source package/x11r7/xlib_libXvMC/Config.in
+source package/x11r7/xlib_libXxf86dga/Config.in
+source package/x11r7/xlib_libXxf86vm/Config.in
+source package/x11r7/xlib_libdmx/Config.in
+source package/x11r7/xlib_libfontenc/Config.in
+source package/x11r7/xlib_libxkbfile/Config.in
+source package/x11r7/xlib_libxshmfence/Config.in
+source package/x11r7/xlib_xtrans/Config.in
+endmenu
+
+menu "X11R7 Applications"
+source package/x11r7/xapp_appres/Config.in
+source package/x11r7/xapp_bdftopcf/Config.in
+source package/x11r7/xapp_beforelight/Config.in
+source package/x11r7/xapp_bitmap/Config.in
+source package/x11r7/xapp_editres/Config.in
+source package/x11r7/xapp_fonttosfnt/Config.in
+source package/x11r7/xapp_fslsfonts/Config.in
+source package/x11r7/xapp_fstobdf/Config.in
+source package/x11r7/xapp_iceauth/Config.in
+source package/x11r7/xapp_ico/Config.in
+source package/x11r7/xapp_listres/Config.in
+source package/x11r7/xapp_luit/Config.in
+source package/x11r7/xapp_mkfontdir/Config.in
+source package/x11r7/xapp_mkfontscale/Config.in
+source package/x11r7/xapp_oclock/Config.in
+source package/x11r7/xapp_rgb/Config.in
+source package/x11r7/xapp_rstart/Config.in
+source package/x11r7/xapp_scripts/Config.in
+source package/x11r7/xapp_sessreg/Config.in
+source package/x11r7/xapp_setxkbmap/Config.in
+source package/x11r7/xapp_showfont/Config.in
+source package/x11r7/xapp_smproxy/Config.in
+source package/x11r7/xapp_twm/Config.in
+source package/x11r7/xapp_viewres/Config.in
+source package/x11r7/xapp_x11perf/Config.in
+source package/x11r7/xapp_xauth/Config.in
+source package/x11r7/xapp_xbacklight/Config.in
+source package/x11r7/xapp_xbiff/Config.in
+source package/x11r7/xapp_xcalc/Config.in
+source package/x11r7/xapp_xclipboard/Config.in
+source package/x11r7/xapp_xclock/Config.in
+source package/x11r7/xapp_xcmsdb/Config.in
+source package/x11r7/xapp_xcompmgr/Config.in
+source package/x11r7/xapp_xconsole/Config.in
+source package/x11r7/xapp_xcursorgen/Config.in
+source package/x11r7/xapp_xdbedizzy/Config.in
+source package/x11r7/xapp_xditview/Config.in
+source package/x11r7/xapp_xdm/Config.in
+source package/x11r7/xapp_xdpyinfo/Config.in
+source package/x11r7/xapp_xdriinfo/Config.in
+source package/x11r7/xapp_xedit/Config.in
+source package/x11r7/xapp_xev/Config.in
+source package/x11r7/xapp_xeyes/Config.in
+source package/x11r7/xapp_xf86dga/Config.in
+source package/x11r7/xapp_xfd/Config.in
+source package/x11r7/xapp_xfindproxy/Config.in
+source package/x11r7/xapp_xfontsel/Config.in
+source package/x11r7/xapp_xfs/Config.in
+source package/x11r7/xapp_xfsinfo/Config.in
+source package/x11r7/xapp_xgamma/Config.in
+source package/x11r7/xapp_xgc/Config.in
+source package/x11r7/xapp_xhost/Config.in
+source package/x11r7/xapp_xinit/Config.in
+source package/x11r7/xapp_xinput/Config.in
+source package/x11r7/xapp_xinput-calibrator/Config.in
+source package/x11r7/xapp_xkbcomp/Config.in
+source package/x11r7/xapp_xkbevd/Config.in
+source package/x11r7/xapp_xkbprint/Config.in
+source package/x11r7/xapp_xkbutils/Config.in
+source package/x11r7/xapp_xkill/Config.in
+source package/x11r7/xapp_xload/Config.in
+source package/x11r7/xapp_xlogo/Config.in
+source package/x11r7/xapp_xlsatoms/Config.in
+source package/x11r7/xapp_xlsclients/Config.in
+source package/x11r7/xapp_xlsfonts/Config.in
+source package/x11r7/xapp_xmag/Config.in
+source package/x11r7/xapp_xman/Config.in
+source package/x11r7/xapp_xmessage/Config.in
+source package/x11r7/xapp_xmh/Config.in
+source package/x11r7/xapp_xmodmap/Config.in
+source package/x11r7/xapp_xmore/Config.in
+source package/x11r7/xapp_xpr/Config.in
+source package/x11r7/xapp_xprop/Config.in
+source package/x11r7/xapp_xrandr/Config.in
+source package/x11r7/xapp_xrdb/Config.in
+source package/x11r7/xapp_xrefresh/Config.in
+source package/x11r7/xapp_xset/Config.in
+source package/x11r7/xapp_xsetmode/Config.in
+source package/x11r7/xapp_xsetpointer/Config.in
+source package/x11r7/xapp_xsetroot/Config.in
+source package/x11r7/xapp_xsm/Config.in
+source package/x11r7/xapp_xstdcmap/Config.in
+source package/x11r7/xapp_xvidtune/Config.in
+source package/x11r7/xapp_xvinfo/Config.in
+source package/x11r7/xapp_xwd/Config.in
+source package/x11r7/xapp_xwininfo/Config.in
+source package/x11r7/xapp_xwud/Config.in
+endmenu
+
+if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+menu "X11R7 Drivers"
+source package/x11r7/xdriver_xf86-input-evdev/Config.in
+source package/x11r7/xdriver_xf86-input-joystick/Config.in
+source package/x11r7/xdriver_xf86-input-keyboard/Config.in
+source package/x11r7/xdriver_xf86-input-libinput/Config.in
+source package/x11r7/xdriver_xf86-input-mouse/Config.in
+source package/x11r7/xdriver_xf86-input-synaptics/Config.in
+source package/x11r7/xdriver_xf86-input-tslib/Config.in
+source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+source package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+source package/x11r7/xdriver_xf86-video-ark/Config.in
+source package/x11r7/xdriver_xf86-video-ast/Config.in
+source package/x11r7/xdriver_xf86-video-ati/Config.in
+source package/x11r7/xdriver_xf86-video-cirrus/Config.in
+source package/x11r7/xdriver_xf86-video-dummy/Config.in
+source package/x11r7/xdriver_xf86-video-fbdev/Config.in
+source package/x11r7/xdriver_xf86-video-fbturbo/Config.in
+source package/x11r7/xdriver_xf86-video-geode/Config.in
+source package/x11r7/xdriver_xf86-video-glint/Config.in
+source package/x11r7/xdriver_xf86-video-i128/Config.in
+source package/x11r7/xdriver_xf86-video-imx/Config.in
+source package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+source package/x11r7/xdriver_xf86-video-intel/Config.in
+source package/x11r7/xdriver_xf86-video-mach64/Config.in
+source package/x11r7/xdriver_xf86-video-mga/Config.in
+source package/x11r7/xdriver_xf86-video-neomagic/Config.in
+source package/x11r7/xdriver_xf86-video-nouveau/Config.in
+source package/x11r7/xdriver_xf86-video-nv/Config.in
+source package/x11r7/xdriver_xf86-video-openchrome/Config.in
+source package/x11r7/xdriver_xf86-video-qxl/Config.in
+source package/x11r7/xdriver_xf86-video-r128/Config.in
+source package/x11r7/xdriver_xf86-video-savage/Config.in
+source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+source package/x11r7/xdriver_xf86-video-sis/Config.in
+source package/x11r7/xdriver_xf86-video-tdfx/Config.in
+source package/x11r7/xdriver_xf86-video-tga/Config.in
+source package/x11r7/xdriver_xf86-video-trident/Config.in
+source package/x11r7/xdriver_xf86-video-vesa/Config.in
+source package/x11r7/xdriver_xf86-video-vmware/Config.in
+source package/x11r7/xdriver_xf86-video-voodoo/Config.in
+endmenu
+endif
+
+menu "X11R7 Fonts"
+source package/x11r7/xfont_font-util/Config.in
+source package/x11r7/xfont_encodings/Config.in
+source package/x11r7/xfont_font-adobe-100dpi/Config.in
+source package/x11r7/xfont_font-adobe-75dpi/Config.in
+source package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
+source package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
+source package/x11r7/xfont_font-adobe-utopia-type1/Config.in
+source package/x11r7/xfont_font-alias/Config.in
+source package/x11r7/xfont_font-arabic-misc/Config.in
+source package/x11r7/xfont_font-bh-100dpi/Config.in
+source package/x11r7/xfont_font-bh-75dpi/Config.in
+source package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
+source package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
+source package/x11r7/xfont_font-bh-ttf/Config.in
+source package/x11r7/xfont_font-bh-type1/Config.in
+source package/x11r7/xfont_font-bitstream-100dpi/Config.in
+source package/x11r7/xfont_font-bitstream-75dpi/Config.in
+source package/x11r7/xfont_font-bitstream-type1/Config.in
+source package/x11r7/xfont_font-cronyx-cyrillic/Config.in
+source package/x11r7/xfont_font-cursor-misc/Config.in
+source package/x11r7/xfont_font-daewoo-misc/Config.in
+source package/x11r7/xfont_font-dec-misc/Config.in
+source package/x11r7/xfont_font-ibm-type1/Config.in
+source package/x11r7/xfont_font-isas-misc/Config.in
+source package/x11r7/xfont_font-jis-misc/Config.in
+source package/x11r7/xfont_font-micro-misc/Config.in
+source package/x11r7/xfont_font-misc-cyrillic/Config.in
+source package/x11r7/xfont_font-misc-ethiopic/Config.in
+source package/x11r7/xfont_font-misc-meltho/Config.in
+source package/x11r7/xfont_font-misc-misc/Config.in
+source package/x11r7/xfont_font-mutt-misc/Config.in
+source package/x11r7/xfont_font-schumacher-misc/Config.in
+source package/x11r7/xfont_font-screen-cyrillic/Config.in
+source package/x11r7/xfont_font-sony-misc/Config.in
+source package/x11r7/xfont_font-sun-misc/Config.in
+source package/x11r7/xfont_font-winitzki-cyrillic/Config.in
+source package/x11r7/xfont_font-xfree86-type1/Config.in
+endmenu
+
+menu "X11R7 X protocols"
+source package/x11r7/xcb-proto/Config.in
+source package/x11r7/xproto_applewmproto/Config.in
+source package/x11r7/xproto_bigreqsproto/Config.in
+source package/x11r7/xproto_compositeproto/Config.in
+source package/x11r7/xproto_damageproto/Config.in
+source package/x11r7/xproto_dmxproto/Config.in
+source package/x11r7/xproto_dri2proto/Config.in
+source package/x11r7/xproto_dri3proto/Config.in
+source package/x11r7/xproto_fixesproto/Config.in
+source package/x11r7/xproto_fontcacheproto/Config.in
+source package/x11r7/xproto_fontsproto/Config.in
+source package/x11r7/xproto_glproto/Config.in
+source package/x11r7/xproto_inputproto/Config.in
+source package/x11r7/xproto_kbproto/Config.in
+source package/x11r7/xproto_presentproto/Config.in
+source package/x11r7/xproto_randrproto/Config.in
+source package/x11r7/xproto_recordproto/Config.in
+source package/x11r7/xproto_renderproto/Config.in
+source package/x11r7/xproto_resourceproto/Config.in
+source package/x11r7/xproto_scrnsaverproto/Config.in
+source package/x11r7/xproto_videoproto/Config.in
+source package/x11r7/xproto_windowswmproto/Config.in
+source package/x11r7/xproto_xcmiscproto/Config.in
+source package/x11r7/xproto_xextproto/Config.in
+source package/x11r7/xproto_xf86bigfontproto/Config.in
+source package/x11r7/xproto_xf86dgaproto/Config.in
+source package/x11r7/xproto_xf86driproto/Config.in
+source package/x11r7/xproto_xf86vidmodeproto/Config.in
+source package/x11r7/xproto_xineramaproto/Config.in
+source package/x11r7/xproto_xproto/Config.in
+source package/x11r7/xproto_xproxymanagementprotocol/Config.in
+endmenu
+
+menu "X11R7 Utilities"
+source package/x11r7/xutil_makedepend/Config.in
+source package/x11r7/mcookie/Config.in
+endmenu
+
+menu "X11R7 Other data"
+source package/x11r7/xdata_xbitmaps/Config.in
+source package/x11r7/xdata_xcursor-themes/Config.in
+source package/x11r7/xcursor-transparent-theme/Config.in
+endmenu
+
 endif
 
 comment "X.org needs a toolchain w/ wchar, threads, dynamic library"
-- 
2.9.3
