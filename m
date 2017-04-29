From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 17:13:48 +0200
Subject: [Buildroot] [git commit] package: clean up indentation warnings in
	Config.in files
Message-ID: <20170429151448.E1A8682167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49d907e39a4a16c75a9c23aa445dcb9996c55472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on indentation issues
on all of these Config.in files. This patch cleans up warnings related to
the indentation of the Config.in files in the package directory

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas: do not change package/kodi/Config.in and package/x11r7/Config.in.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/b43-firmware/Config.in       |   8 +-
 package/binutils/Config.in.host      |  12 +--
 package/gcc/Config.in.host           | 156 +++++++++++++++++------------------
 package/gdb/Config.in.host           |  12 +--
 package/jquery-ui-themes/Config.in   |  96 ++++++++++-----------
 package/linux-headers/Config.in.host |  85 +++++++++----------
 package/lua/Config.in                |  12 +--
 package/uclibc/Config.in             |  28 +++----
 8 files changed, 205 insertions(+), 204 deletions(-)

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
 
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 846c825..5c67626 100644
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
 
