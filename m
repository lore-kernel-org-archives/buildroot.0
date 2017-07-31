From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:09:59 +0200
Subject: [Buildroot] [git commit] package/l*: fix wrapping of Config.in help
	text
Message-ID: <20170731170652.D8A5A7FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e874251c854b50797383a7b2676992af9dbf961e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter l in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lbreakout2/Config.in         | 10 +++++-----
 package/lcdapi/Config.in             |  3 ++-
 package/lcms2/Config.in              |  5 +++--
 package/leafnode2/Config.in          |  3 ++-
 package/leveldb/Config.in            |  5 +++--
 package/lftp/Config.in               |  9 +++++----
 package/lighttpd/Config.in           | 15 ++++++++-------
 package/linknx/Config.in             |  4 ++--
 package/linux-backports/Config.in    |  8 +++++---
 package/linux-firmware/Config.in     | 12 ++++++++----
 package/linux-headers/Config.in.host | 17 +++++++++--------
 package/linux-pam/Config.in          |  3 ++-
 package/live555/Config.in            |  5 +++--
 package/ljsyscall/Config.in          |  3 ++-
 package/lm-sensors/Config.in         |  6 +++---
 package/logsurfer/Config.in          |  4 ++--
 package/lpc3250loader/Config.in.host |  4 ++--
 package/lshw/Config.in               |  3 ++-
 package/ltrace/Config.in             |  8 ++++----
 package/lua-cjson/Config.in          |  6 ++++--
 package/lua/Config.in                |  3 ++-
 package/luabitop/Config.in           |  4 ++--
 package/luacrypto/Config.in          |  6 +++---
 package/luaexpatutils/Config.in      |  5 +++--
 package/lualogging/Config.in         |  8 ++++----
 package/luvi/Config.in               | 13 +++++++------
 package/lvm2/Config.in               | 22 ++++++++++++----------
 package/lxc/Config.in                |  7 ++++---
 package/lz4/Config.in                |  8 ++++----
 package/lzip/Config.in               |  9 +++++----
 package/lzop/Config.in               |  3 ++-
 31 files changed, 124 insertions(+), 97 deletions(-)

diff --git a/package/lbreakout2/Config.in b/package/lbreakout2/Config.in
index 6788aca..eeb8a06 100644
--- a/package/lbreakout2/Config.in
+++ b/package/lbreakout2/Config.in
@@ -3,11 +3,11 @@ config BR2_PACKAGE_LBREAKOUT2
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_LIBPNG
 	help
-	  LBreakout2 is the successor to LBreakout, a breakout-style arcade
-	  game in the manner of Arkanoid. Requires SDL, libpng, and
-	  optionnally SDL_mixer/SDL_net.
-	  A display with minimum 640x480 resolution, a keyboard and a mouse
-	  are recommanded.
+	  LBreakout2 is the successor to LBreakout, a breakout-style
+	  arcade game in the manner of Arkanoid. Requires SDL, libpng,
+	  and optionnally SDL_mixer/SDL_net.
+	  A display with minimum 640x480 resolution, a keyboard and a
+	  mouse are recommanded.
 
 	  http://lgames.sourceforge.net/index.php?project=LBreakout2
 
diff --git a/package/lcdapi/Config.in b/package/lcdapi/Config.in
index 34ce0fa..154689b 100644
--- a/package/lcdapi/Config.in
+++ b/package/lcdapi/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LCDAPI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  C++ client API for lcdproc, containing a set of widget classes.
+	  C++ client API for lcdproc, containing a set of widget
+	  classes.
 
 	  https://github.com/spdawson/lcdapi
 
diff --git a/package/lcms2/Config.in b/package/lcms2/Config.in
index d94c075..19e1b9c 100644
--- a/package/lcms2/Config.in
+++ b/package/lcms2/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_LCMS2
 	  Little Color Management Software (CMS) intends to be an OPEN
 	  SOURCE small-footprint color management engine, with special
 	  focus on accuracy and performance.
-	  It uses the International Color Consortium standard (ICC), which is
-	  the modern standard when regarding to color management.
+	  It uses the International Color Consortium standard (ICC),
+	  which is the modern standard when regarding to color
+	  management.
 
 	  http://www.littlecms.com/
diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index 348e6da..93d3090 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_LEAFNODE2
 	  server designed for small sites with just a few active
 	  newsgroups.
 
-	  Leafnode-2 needs inetd, check chapter 14 of the documentation at
+	  Leafnode-2 needs inetd, check chapter 14 of the documentation
+	  at:
 	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/leafnode-readme.txt
 
 	  For example, you can add this line to inetd.conf:
diff --git a/package/leveldb/Config.in b/package/leveldb/Config.in
index b583c3b..c44ef13 100644
--- a/package/leveldb/Config.in
+++ b/package/leveldb/Config.in
@@ -6,8 +6,9 @@ config BR2_PACKAGE_LEVELDB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_SNAPPY
 	help
-	  LevelDB is a fast key-value storage library written at Google that
-	  provides an ordered mapping from string keys to string values.
+	  LevelDB is a fast key-value storage library written at Google
+	  that provides an ordered mapping from string keys to string
+	  values.
 
 	  https://github.com/google/leveldb
 
diff --git a/package/lftp/Config.in b/package/lftp/Config.in
index fb4ac13..ebe8882 100644
--- a/package/lftp/Config.in
+++ b/package/lftp/Config.in
@@ -7,10 +7,11 @@ config BR2_PACKAGE_LFTP
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	help
-	  LFTP is a sophisticated ftp/http client, and a file transfer program
-	  supporting a number of network protocols. Like BASH, it has job
-	  control and uses the readline library for input. It has bookmarks,
-	  a built-in mirror command, and can transfer several files in parallel.
+	  LFTP is a sophisticated ftp/http client, and a file transfer
+	  program supporting a number of network protocols. Like BASH,
+	  it has job control and uses the readline library for input. It
+	  has bookmarks, a built-in mirror command, and can transfer
+	  several files in parallel.
 	  It was designed with reliability in mind.
 
 	  http://lftp.yar.ru/
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index f62ccb9..383c10f 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -7,13 +7,14 @@ config BR2_PACKAGE_LIGHTTPD
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	help
-	  lighttpd a secure, fast, compliant and very flexible web-server
-	  which has been optimized for high-performance environments. It
-	  has a very low memory footprint compared to other webservers and
-	  takes care of cpu-load. Its advanced feature-set (FastCGI, CGI,
-	  Auth, Output-Compression, URL-Rewriting and many more) make
-	  lighttpd the perfect webserver-software for every server that
-	  is suffering load problems.
+	  lighttpd a secure, fast, compliant and very flexible
+	  web-server which has been optimized for high-performance
+	  environments. It has a very low memory footprint compared to
+	  other webservers and takes care of cpu-load. Its advanced
+	  feature-set (FastCGI, CGI, Auth, Output-Compression,
+	  URL-Rewriting and many more) make lighttpd the perfect
+	  webserver-software for every server that is suffering load
+	  problems.
 
 	  http://www.lighttpd.net/
 
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 478d019..6657107 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_LINKNX
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
-	  Linknx is an automation platform providing high level functionalities
-	  to EIB/KNX installation.
+	  Linknx is an automation platform providing high level
+	  functionalities to EIB/KNX installation.
 
 	  http://linknx.sourceforge.net/
 	  https://github.com/linknx/linknx
diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
index e858a45..362e6e4 100644
--- a/package/linux-backports/Config.in
+++ b/package/linux-backports/Config.in
@@ -8,7 +8,8 @@ config BR2_PACKAGE_LINUX_BACKPORTS
 	  The linux-backports package includes many Linux drivers from
 	  recent kernels, backported to older ones.
 
-	  This version of linux-backports supports kernels starting from 3.0.
+	  This version of linux-backports supports kernels starting
+	  from 3.0.
 
 	  https://backports.wiki.kernel.org
 
@@ -40,8 +41,9 @@ config BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE
 	help
 	  Path to the backports configuration file
 
-	  Note: this can be a defconfig file or a complete .config file,
-	  which can later be saved back with make linux-update-(def)config.
+	  Note: this can be a defconfig file or a complete .config
+	  file, which can later be saved back with make
+	  linux-update-(def)config.
 
 config BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES
 	string "Additional configuration fragment files"
diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7f4d2a0..f0d6476 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -249,7 +249,8 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
-	  Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
+	  Firmware files for WLAN and Bluetooth modules wl1271 and
+	  wl1273
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
 	bool "TI wl128x"
@@ -268,17 +269,20 @@ menu "Ethernet firmware"
 config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	bool "Broadcom NetXtremeII"
 	help
-	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
+	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards
+	  (bnx2x)
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
 	bool "Chelsio T4"
 	help
-	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards (cxgb4)
+	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards
+	  (cxgb4)
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	bool "Chelsio T5"
 	help
-	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards (cxgb4)
+	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards
+	  (cxgb4)
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index af67f70..90c93ba 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -10,17 +10,17 @@ choice
 	help
 	  Select the kernel version to get headers from.
 
-	  The kernel headers must be at least as old as the oldest kernel
-	  you intend to run on your target.
+	  The kernel headers must be at least as old as the oldest
+	  kernel you intend to run on your target.
 
 	  If you use Buildroot to build a kernel, then you can use
 	  the sources from that kernel as source for the headers.
 
-	  If you choose a custom version of the kernel headers, or choose
-	  to use the same sources as the kernel, you'll have to select
-	  (below) the series of that kernel, so that Buildroot can show
-	  or hide packages that have strong requirements on the kernel
-	  headers.
+	  If you choose a custom version of the kernel headers, or
+	  choose to use the same sources as the kernel, you'll have to
+	  select (below) the series of that kernel, so that Buildroot
+	  can show or hide packages that have strong requirements on the
+	  kernel headers.
 
 config BR2_KERNEL_HEADERS_AS_KERNEL
 	bool "Same as kernel being built"
@@ -86,7 +86,8 @@ choice
 	bool "Custom kernel headers series"
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL
 	help
-	  Specify the kernel headers series you manually selected, above.
+	  Specify the kernel headers series you manually selected,
+	  above.
 
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 33e5154..1396549 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_LINUX_PAM
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FLEX
 	help
-	  A Security Framework that Provides Authentication for Applications
+	  A Security Framework that Provides Authentication for
+	  Applications
 
 	  http://linux-pam.org
 
diff --git a/package/live555/Config.in b/package/live555/Config.in
index 5018296..dbd9dfd 100644
--- a/package/live555/Config.in
+++ b/package/live555/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_LIVE555
 	bool "live555"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  LIVE555 Streaming Media forms a set of C++ libraries for multimedia
-	  streaming, using open standard protocols (RTP/RTCP, RTSP, SIP).
+	  LIVE555 Streaming Media forms a set of C++ libraries for
+	  multimedia streaming, using open standard protocols
+	  (RTP/RTCP, RTSP, SIP).
 
 	  http://www.live555.com/liveMedia/
 
diff --git a/package/ljsyscall/Config.in b/package/ljsyscall/Config.in
index d78591e..3af9dab 100644
--- a/package/ljsyscall/Config.in
+++ b/package/ljsyscall/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LJSYSCALL
 	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
 	help
-	  An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
+	  An FFI implementation of the Linux and NetBSD kernel ABIs for
+	  LuaJIT.
 
 	  http://github.com/justincormack/ljsyscall
 
diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index b035f5d..60571b7 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -38,9 +38,9 @@ config BR2_PACKAGE_LM_SENSORS_ISASET
 config BR2_PACKAGE_LM_SENSORS_PWMCONFIG
 	bool "pwmconfig"
 	help
-	  Pwmconfig searches your sensors for pulse width modulation (PWM)
-	  controls, and tests each one to see if it controls a fan on
-	  your motherboard.
+	  Pwmconfig searches your sensors for pulse width modulation
+	  (PWM) controls, and tests each one to see if it controls a fan
+	  on your motherboard.
 
 config BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT
 	bool "sensors-detect"
diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
index d4218bc..43e2f51 100644
--- a/package/logsurfer/Config.in
+++ b/package/logsurfer/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LOGSURFER
 	bool "logsurfer"
 	depends on BR2_USE_MMU # fork()
 	help
-	  Logsurfer is a program for monitoring system logs in real-time,
-	  and reporting on the occurrence of events.
+	  Logsurfer is a program for monitoring system logs in
+	  real-time, and reporting on the occurrence of events.
 
 	  http://www.crypt.gen.nz/logsurfer/
diff --git a/package/lpc3250loader/Config.in.host b/package/lpc3250loader/Config.in.host
index 9371f13..946820a 100644
--- a/package/lpc3250loader/Config.in.host
+++ b/package/lpc3250loader/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_LPC3250LOADER
 	bool "host lpc3250loader"
 	help
-	  lpc3250loader is a tool to load/burn programs (in particular kickstart
-	  and S1L) on an LPC3250 platform.
+	  lpc3250loader is a tool to load/burn programs (in particular
+	  kickstart and S1L) on an LPC3250 platform.
 
 	  https://github.com/alexandrebelloni/lpc3250loader
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 83b7ffb..3caac66 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_USE_WCHAR
 	help
 	  lshw (Hardware Lister) is a small tool to provide
-	  detailed information on the hardware configuration of the machine.
+	  detailed information on the hardware configuration of the
+	  machine.
 
 	  http://ezix.org/project/wiki/HardwareLiSter
 
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 0fc1b95..4d5fb72 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -11,10 +11,10 @@ config BR2_PACKAGE_LTRACE
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
 	select BR2_PACKAGE_ELFUTILS
 	help
-	  Debugging program which runs a specified command until it exits.
-	  While the command is executing, ltrace intercepts and records
-	  the dynamic library calls which are called by the executed
-	  process and the signals received by that process.
+	  Debugging program which runs a specified command until it
+	  exits. While the command is executing, ltrace intercepts and
+	  records the dynamic library calls which are called by the
+	  executed process and the signals received by that process.
 
 	  http://ltrace.org
 
diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 1f4c7c7..262452a 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -2,9 +2,11 @@ config BR2_PACKAGE_LUA_CJSON
 	bool "lua-cjson"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  The Lua CJSON module provides JSON support for Lua. It features:
+	  The Lua CJSON module provides JSON support for Lua.
+	  It features:
 	  - Fast, standards compliant encoding/parsing routines
-	  - Full support for JSON with UTF-8, including decoding surrogate pairs
+	  - Full support for JSON with UTF-8, including decoding
+	    surrogate pairs
 	  - Optional run-time support for common exceptions to the JSON
 	    specification (infinity, NaN, ...)
 	  - No dependencies on other libraries
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 35910cb..4d2f0e9 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_LUA
 	bool "lua"
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
-	  Lua is a powerful, fast, light-weight, embeddable scripting language.
+	  Lua is a powerful, fast, light-weight, embeddable scripting
+	  language.
 
 	  http://www.lua.org/
 
diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
index 26442fc..a819fe8 100644
--- a/package/luabitop/Config.in
+++ b/package/luabitop/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LUABITOP
 	bool "luabitop"
 	depends on !BR2_PACKAGE_LUA_5_3
 	help
-	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds bitwise
-	  operations on numbers.
+	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds
+	  bitwise operations on numbers.
 
 	  http://bitop.luajit.org
 
diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
index 8d13eec..e9d43cd 100644
--- a/package/luacrypto/Config.in
+++ b/package/luacrypto/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_LUACRYPTO
 	help
 	  LuaCrypto provides a Lua frontend to the OpenSSL cryptographic
 	  library.
-	  The OpenSSL features that are currently exposed are digests (MD5,
-	  SHA-1, HMAC, and more) and crypto-grade random number generators
-	  communication.
+	  The OpenSSL features that are currently exposed are digests
+	  (MD5, SHA-1, HMAC, and more) and crypto-grade random number
+	  generators communication.
 
 	  http://luacrypto.luaforge.net
diff --git a/package/luaexpatutils/Config.in b/package/luaexpatutils/Config.in
index cb2887a..28a7b09 100644
--- a/package/luaexpatutils/Config.in
+++ b/package/luaexpatutils/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_LUAEXPATUTILS
 	bool "luaexpatutils"
 	select BR2_PACKAGE_LUAEXPAT
 	help
-	  lxp.doc is a module that provides useful features for working with
-	  XML formats in LOM format as used by the LuaExpat project from Kepler.
+	  lxp.doc is a module that provides useful features for working
+	  with XML formats in LOM format as used by the LuaExpat project
+	  from Kepler.
 
 	  https://github.com/stevedonovan/LuaExpatUtils
diff --git a/package/lualogging/Config.in b/package/lualogging/Config.in
index 37d7015..bb87f57 100644
--- a/package/lualogging/Config.in
+++ b/package/lualogging/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LUALOGGING
 	bool "lualogging"
 	help
-	  LuaLogging provides a simple API to use logging features in Lua.
-	  Its design was based on log4j. LuaLogging currently supports,
-	  through the use of appenders, console, file, rolling file, email,
-	  socket and SQL outputs.
+	  LuaLogging provides a simple API to use logging features in
+	  Lua. Its design was based on log4j. LuaLogging currently
+	  supports, through the use of appenders, console, file, rolling
+	  file, email, socket and SQL outputs.
 
 	  http://www.keplerproject.org/lualogging/
diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index a9dd2ef..c9fd417 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -8,15 +8,16 @@ config BR2_PACKAGE_LUVI
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LUV
 	help
-	  A project in-between luv and luvit. The goal of this is to make
-	  building luvit and derivatives much easier.
+	  A project in-between luv and luvit. The goal of this is to
+	  make building luvit and derivatives much easier.
 
 	  luvi extends LuaJIT with asynchronous I/O and several optional
-	  modules to run Lua applications and build self-contained binaries
-	  on systems that don't have a compiler.
+	  modules to run Lua applications and build self-contained
+	  binaries on systems that don't have a compiler.
 
-	  The luvi core can be extended with several Lua modules by adding its
-	  bundled Lua binding libraries. To get the Lua module...
+	  The luvi core can be extended with several Lua modules by
+	  adding its bundled Lua binding libraries.
+	  To get the Lua module...
 	    * 'rex' select PCRE (BR2_PACKAGE_PCRE)
 	    * 'ssl' select OpenSSL (BR2_PACKAGE_OPENSSL)
 	    * 'zlib' select zlib (BR2_PACKAGE_ZLIB)
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 0f60649..32c7639 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -7,17 +7,19 @@ config BR2_PACKAGE_LVM2
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
-	  LVM supports enterprise level volume management of disk and disk
-	  subsystems by grouping arbitrary disks into volume groups. The total
-	  capacity of volume groups can be allocated to logical volumes, which
-	  are accessed as regular block devices.
+	  LVM supports enterprise level volume management of disk and
+	  disk subsystems by grouping arbitrary disks into volume
+	  groups. The total capacity of volume groups can be allocated
+	  to logical volumes, which are accessed as regular block
+	  devices.
 
 	  The Linux Kernel Device Mapper is the LVM
 	  (Linux Logical Volume Management) Team's implementation of a
-	  minimalistic kernel-space driver that handles volume management,
-	  while keeping knowledge of the underlying device layout in
-	  user-space. This makes it useful for not only LVM, but EVMS,
-	  software raid, and other drivers that create "virtual" block devices.
+	  minimalistic kernel-space driver that handles volume
+	  management, while keeping knowledge of the underlying device
+	  layout in user-space. This makes it useful for not only LVM,
+	  but EVMS, software raid, and other drivers that create
+	  "virtual" block devices.
 
 	  http://www.sourceware.org/lvm2/
 
@@ -27,8 +29,8 @@ config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
 	help
-	  Install the standard suite of lvm2 programs. When this option is not
-	  set, only dmsetup is installed.
+	  Install the standard suite of lvm2 programs. When this option
+	  is not set, only dmsetup is installed.
 
 config BR2_PACKAGE_LVM2_APP_LIBRARY
 	bool "install application library"
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 22aa813..d90e788 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_LXC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # setns() system call
 	help
-	  Linux Containers (LXC), provides the ability to group and isolate
-	  of a set of processes in a jail by virtualizing and accounting the
-	  kernel resources. It is similar to Linux-Vserver or Openvz.
+	  Linux Containers (LXC), provides the ability to group and
+	  isolate of a set of processes in a jail by virtualizing and
+	  accounting the kernel resources. It is similar to
+	  Linux-Vserver or Openvz.
 
 	  https://linuxcontainers.org/
 
diff --git a/package/lz4/Config.in b/package/lz4/Config.in
index 4a00a70..9f12299 100644
--- a/package/lz4/Config.in
+++ b/package/lz4/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_LZ4
 	bool "lz4"
 	help
 	  LZ4 is a very fast lossless compression algorithm, providing
-	  compression speed at 400 MB/s per core, scalable with multi-cores
-	  CPU. It also features an extremely fast decoder, with speed
-	  in multiple GB/s per core, typically reaching RAM speed limits
-	  on multi-core systems.
+	  compression speed at 400 MB/s per core, scalable with
+	  multi-cores CPU. It also features an extremely fast decoder,
+	  with speed in multiple GB/s per core, typically reaching RAM
+	  speed limits on multi-core systems.
 
 	  http://www.lz4.org/
diff --git a/package/lzip/Config.in b/package/lzip/Config.in
index 821cd26..d406e77 100644
--- a/package/lzip/Config.in
+++ b/package/lzip/Config.in
@@ -5,10 +5,11 @@ config BR2_PACKAGE_LZIP
 	bool "lzip"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  Lzip is a lossless data compressor with a user interface similar
-	  to the one of gzip or bzip2.
+	  Lzip is a lossless data compressor with a user interface
+	  similar to the one of gzip or bzip2.
 	  Lzip is about as fast as gzip, compresses most files more than
-	  bzip2, and is better than both from a data recovery perspective.
-	  Lzip is a clean implementation of the LZMA algorithm.
+	  bzip2, and is better than both from a data recovery
+	  perspective. Lzip is a clean implementation of the LZMA
+	  algorithm.
 
 	  http://www.nongnu.org/lzip/lzip.html
diff --git a/package/lzop/Config.in b/package/lzop/Config.in
index c911823..236f21d 100644
--- a/package/lzop/Config.in
+++ b/package/lzop/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LZOP
 	select BR2_PACKAGE_LZO
 	help
 	  lzop is a file compressor which is very similar to gzip.
-	  lzop uses the LZO data compression library for compression services.
+	  lzop uses the LZO data compression library for compression
+	  services.
 
 	  http://www.lzop.org/
