From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  5 May 2017 10:08:07 -0400
Subject: [Buildroot] [PATCH v2 3/4] fix help text wrapping for configs c
In-Reply-To: <20170505140808.17696-1-aduskett@codeblue.com>
References: <20170505140808.17696-1-aduskett@codeblue.com>
Message-ID: <20170505140808.17696-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter c in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v1 -> v2:
  - Added patch to series.

 package/ca-certificates/Config.in |  3 ++-
 package/canfestival/Config.in     | 10 ++++----
 package/ccrypt/Config.in          |  3 ++-
 package/cegui06/Config.in         | 12 +++++-----
 package/celt051/Config.in         |  8 +++----
 package/cjson/Config.in           |  4 ++--
 package/clamav/Config.in          |  4 ++--
 package/clapack/Config.in         |  9 +++----
 package/collectd/Config.in        | 50 +++++++++++++++++++++++----------------
 package/cppdb/Config.in           |  7 +++---
 package/cpuload/Config.in         |  7 +++---
 package/crda/Config.in            |  4 ++--
 package/cryptodev/Config.in       |  4 ++--
 package/curlftpfs/Config.in       |  4 ++--
 package/cvs/Config.in             |  3 ++-
 package/cwiid/Config.in           |  4 ++--
 16 files changed, 76 insertions(+), 60 deletions(-)

diff --git a/package/ca-certificates/Config.in b/package/ca-certificates/Config.in
index a278a62..6bb7182 100644
--- a/package/ca-certificates/Config.in
+++ b/package/ca-certificates/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CA_CERTIFICATES
 	  connections.
 
 	  It includes, among others, certificate authorities used by the
-	  Debian infrastructure and those shipped with Mozilla's browsers.
+	  Debian infrastructure and those shipped with Mozilla's
+	  browsers.
 
 	  http://anonscm.debian.org/gitweb/?p=collab-maint/ca-certificates.git
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index ca94956..8300e26 100644
--- a/package/canfestival/Config.in
+++ b/package/canfestival/Config.in
@@ -16,8 +16,8 @@ config BR2_PACKAGE_CANFESTIVAL
 	depends on !BR2_STATIC_LIBS
 	help
 	  CanFestival is an OpenSource CANOpen framework, licensed under
-	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan and
-	  copcican_comedi).
+	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan
+	  and copcican_comedi).
 
 	  http://www.canfestival.org
 
@@ -78,9 +78,9 @@ config BR2_PACKAGE_CANFESTIVAL_DRIVER
 config BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS
 	string "additional configure options"
 	help
-	  Additional options can be passed directly to the configure script
-	  (e.g.: --MAX_CAN_BUS_ID=..., --SDO_MAX_LENGTH_TRANSFER=...,
-	  --SDO_BLOCK_SIZE=...).
+	  Additional options can be passed directly to the configure
+	  script (e.g.: --MAX_CAN_BUS_ID=...,
+	  --SDO_MAX_LENGTH_TRANSFER=..., --SDO_BLOCK_SIZE=...).
 
 config BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES
 	bool "install examples"
diff --git a/package/ccrypt/Config.in b/package/ccrypt/Config.in
index ef5a7ee..109271a 100644
--- a/package/ccrypt/Config.in
+++ b/package/ccrypt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CCRYPT
 	bool "ccrypt"
 	help
-	  ccrypt is a utility for encrypting and decrypting files and streams.
+	  ccrypt is a utility for encrypting and decrypting files and
+	  streams.
 
 	  http://ccrypt.sourceforge.net/
diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
index e6a024a..0139d32 100644
--- a/package/cegui06/Config.in
+++ b/package/cegui06/Config.in
@@ -10,11 +10,11 @@ config BR2_PACKAGE_CEGUI06
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_PCRE
 	help
-	  Crazy Eddie's GUI System is a free library providing windowing and
-	  widgets for graphics APIs / engines where such functionality is not
-	  natively available, or severely lacking. The library is object
-	  orientated, written in C++, and targeted at games developers who
-	  should be spending their time creating great games, not building
-	  GUI sub-systems!
+	  Crazy Eddie's GUI System is a free library providing windowing
+	  and widgets for graphics APIs / engines where such
+	  functionality is not natively available, or severely lacking.
+	  The library is object orientated, written in C++, and targeted
+	  at games developers who should be spending their time creating
+	  great games, not building GUI sub-systems!
 
 	  http://www.cegui.org.uk/
diff --git a/package/celt051/Config.in b/package/celt051/Config.in
index 035e262..e151319 100644
--- a/package/celt051/Config.in
+++ b/package/celt051/Config.in
@@ -5,10 +5,10 @@ config BR2_PACKAGE_CELT051
 	  The CELT ultra-low delay audio codec
 
 	  The CELT codec is a compression algorithm for audio. Like MP3,
-	  Vorbis, and AAC it is suitable for transmitting music with high
-	  quality. Unlike these formats CELT imposes very little delay on
-	  the signal, even less than is typical for speech centric formats
-	  like Speex, GSM, or G.729.
+	  Vorbis, and AAC it is suitable for transmitting music with
+	  high quality. Unlike these formats CELT imposes very little
+	  delay on the signal, even less than is typical for speech
+	  centric formats like Speex, GSM, or G.729.
 
 	  Note: this is version 0.5.1.3 of celt.
 
diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index 04eff4c..ee18fce 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CJSON
 	bool "cJSON"
 	help
-	  An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C
-	  compliant JSON parser, under MIT license.
+	  An ultra-lightweight, portable, single-file, simple-as-can-be
+	  ANSI-C compliant JSON parser, under MIT license.
 
 	  https://github.com/DaveGamble/cJSON
diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 051df0d..a962103 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_CLAMAV
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
-	  ClamAV is an open source antivirus engine for detecting trojans,
-	  viruses, malware & other malicious threats.
+	  ClamAV is an open source antivirus engine for detecting
+	  trojans, viruses, malware & other malicious threats.
 
 	  http://www.clamav.net
 
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index 7d1f940..e5be0b6 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -23,10 +23,11 @@ config BR2_PACKAGE_CLAPACK_ARITH_H
 	string "Custom BLAS arith.h"
 	depends on BR2_PACKAGE_CLAPACK
 	help
-	  To optimize BLAS library for the hardware, an 'arith.h' header should
-	  be provided.
+	  To optimize BLAS library for the hardware, an 'arith.h' header
+	  should be provided.
 
 	  If empty, the library will not be optimized by the compiler.
 
-	  In any case an 'arithchk' program is built (but not installed), to be run
-	  on the target to generate this arith.h header.
+	  In any case an 'arithchk' program is built
+	  (but not installed), to be run on the target to generate this
+	  arith.h header.
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 47bfe95..3921d7c 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -89,8 +89,8 @@ config BR2_PACKAGE_COLLECTD_SYSLOG
 config BR2_PACKAGE_COLLECTD_THRESHOLD
 	bool "threshold"
 	help
-	  Checks values against configured thresholds and creates notifications
-	  if values are out of bounds.
+	  Checks values against configured thresholds and creates
+	  notifications if values are out of bounds.
 
 endmenu
 
@@ -140,17 +140,20 @@ config BR2_PACKAGE_COLLECTD_CGROUPS
 config BR2_PACKAGE_COLLECTD_CONNTRACK
 	bool "conntrack"
 	help
-	  Collects the number of entries in Linux's connection tracking table.
+	  Collects the number of entries in Linux's connection tracking
+	  table.
 
 config BR2_PACKAGE_COLLECTD_CONTEXTSWITCH
 	bool "contextswitch"
 	help
-	  Collects the number of context switches done by the operating system.
+	  Collects the number of context switches done by the operating
+	  system.
 
 config BR2_PACKAGE_COLLECTD_CPU
 	bool "cpu"
 	help
-	  Collects the amount of time spent by the CPU in various states.
+	  Collects the amount of time spent by the CPU in various
+	  states.
 
 config BR2_PACKAGE_COLLECTD_CPUFREQ
 	bool "cpufreq"
@@ -229,7 +232,8 @@ config BR2_PACKAGE_COLLECTD_FHCOUNT
 config BR2_PACKAGE_COLLECTD_FILECOUNT
 	bool "filecount"
 	help
-	  Counts the number of files in a directory and all its subdirectories.
+	  Counts the number of files in a directory and all its
+	  subdirectories.
 
 config BR2_PACKAGE_COLLECTD_FSCACHE
 	bool "fscache"
@@ -323,7 +327,8 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MYSQL
 	help
-	  Connects to a MySQL database and issues a "show status" command.
+	  Connects to a MySQL database and issues a "show status"
+	  command.
 
 config BR2_PACKAGE_COLLECTD_NETLINK
 	bool "netlink"
@@ -334,7 +339,8 @@ config BR2_PACKAGE_COLLECTD_NETLINK
 config BR2_PACKAGE_COLLECTD_NFS
 	bool "nfs"
 	help
-	  Collects information about the usage of the Network File System.
+	  Collects information about the usage of the Network File
+	  System.
 
 config BR2_PACKAGE_COLLECTD_NGINX
 	bool "nginx"
@@ -358,7 +364,8 @@ config BR2_PACKAGE_COLLECTD_OPENLDAP
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_OPENLDAP
 	help
-	  Read monitoring information from OpenLDAP's cn=Monitor subtree.
+	  Read monitoring information from OpenLDAP's cn=Monitor
+	  subtree.
 
 comment "openldap support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
@@ -409,8 +416,8 @@ config BR2_PACKAGE_COLLECTD_SMART
 	depends on BR2_PACKAGE_HAS_UDEV # libatasmart
 	select BR2_PACKAGE_LIBATASMART
 	help
-	  Collect SMART statistics, notably load cycle count, temperature
-	  and bad sectors.
+	  Collect SMART statistics, notably load cycle count,
+	  temperature and bad sectors.
 
 comment "SMART requires udev to be enabled"
 	depends on !BR2_PACKAGE_HAS_UDEV
@@ -445,8 +452,8 @@ config BR2_PACKAGE_COLLECTD_TAIL
 config BR2_PACKAGE_COLLECTD_TAIL_CSV
 	bool "tail csv"
 	help
-	  Follows (tails) files in CSV format, parses each line and submits
-	  extracted values.
+	  Follows (tails) files in CSV format, parses each line and 
+	  submits extracted values.
 
 config BR2_PACKAGE_COLLECTD_TCPCONNS
 	bool "tcpconns"
@@ -516,7 +523,8 @@ comment "Select at least one for collectd to be useful"
 config BR2_PACKAGE_COLLECTD_CSV
 	bool "csv"
 	help
-	  Writes values to a plain-text file in Comma Separated Values format.
+	  Writes values to a plain-text file in Comma Separated Values
+	  format.
 
 config BR2_PACKAGE_COLLECTD_GRAPHITE
 	bool "graphite"
@@ -554,7 +562,8 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
-	  Sends data to Riemann, a stream processing and monitoring system.
+	  Sends data to Riemann, a stream processing and monitoring
+	  system.
 
 config BR2_PACKAGE_COLLECTD_UNIXSOCK
 	bool "unixsock"
@@ -566,7 +575,8 @@ config BR2_PACKAGE_COLLECTD_WRITEHTTP
 	bool "write_http"
 	select BR2_PACKAGE_LIBCURL
 	help
-	  Sends values collected to a web-server using HTTP POST and PUTVAL.
+	  Sends values collected to a web-server using HTTP POST and
+	  PUTVAL.
 
 config BR2_PACKAGE_COLLECTD_WRITELOG
 	bool "write_log"
@@ -590,14 +600,14 @@ comment "write_prometheus needs a toolchain w/ C++"
 config BR2_PACKAGE_COLLECTD_WRITESENSU
 	bool "write_sensu"
 	help
-	  Sends data to Sensu, a stream processing and monitoring system,
-	  via the Sensu client local TCP socket.
+	  Sends data to Sensu, a stream processing and monitoring
+	  system, via the Sensu client local TCP socket.
 
 config BR2_PACKAGE_COLLECTD_WRITETSDB
 	bool "write_tsdb"
 	help
-	  Sends data OpenTSDB, a scalable no master, no shared state time
-	  series database.
+	  Sends data OpenTSDB, a scalable no master, no shared state
+	  time series database.
 
 endmenu
 
diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
index 9037a7a..ceff0ab 100644
--- a/package/cppdb/Config.in
+++ b/package/cppdb/Config.in
@@ -7,9 +7,10 @@ config BR2_PACKAGE_CPPDB
 	# Can be built without them but it's useless
 	depends on BR2_PACKAGE_MYSQL || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
 	help
-	  CppDB is an SQL connectivity library that is designed to provide
-	  platform and Database independent connectivity API similarly
-	  to what JDBC, ODBC and other connectivity libraries do.
+	  CppDB is an SQL connectivity library that is designed to
+	  provide platform and Database independent connectivity API
+	  similarly to what JDBC, ODBC and other connectivity libraries
+	  do.
 
 	  http://cppcms.com/sql/cppdb/
 
diff --git a/package/cpuload/Config.in b/package/cpuload/Config.in
index 82bc450..9a7b4e9 100644
--- a/package/cpuload/Config.in
+++ b/package/cpuload/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_CPULOAD
 	bool "cpuload"
 	help
-	  cpuload is a simple tool to obtain intuitive vision of CPU load
-	  (including total, user, system, irq and softirq) within a certain
-	  time, which is especially useful for embedded system without GUI.
+	  cpuload is a simple tool to obtain intuitive vision of CPU
+	  load (including total, user, system, irq and softirq) within a
+	  certain time, which is especially useful for embedded system
+	  without GUI.
 
 	  https://github.com/kelvincheung/cpuload
diff --git a/package/crda/Config.in b/package/crda/Config.in
index 2cb0403..b9a2613 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -12,8 +12,8 @@ config BR2_PACKAGE_CRDA
 
 	  This package provides a Central Regulatory Domain Agent (CRDA)
 	  to be used by the Linux kernel cf80211 wireless subsystem to
-	  query and apply the regulatory domain settings wireless devices
-	  may operate within for a given location.
+	  query and apply the regulatory domain settings wireless
+	  devices may operate within for a given location.
 
 	  http://linuxwireless.org/en/developers/Regulatory/CRDA
 
diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
index 9f9df02..d1e6449 100644
--- a/package/cryptodev/Config.in
+++ b/package/cryptodev/Config.in
@@ -31,8 +31,8 @@ config BR2_PACKAGE_OCF_LINUX
 	select BR2_PACKAGE_HAS_CRYPTODEV
 	help
 	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
-	  Framework (OCF). This port aims to bring full asynchronous HW/SW
-	  crypto acceleration to the Linux kernel and applications
+	  Framework (OCF). This port aims to bring full asynchronous
+	  HW/SW crypto acceleration to the Linux kernel and applications
 	  running under Linux.
 
 	  http://ocf-linux.sourceforge.net/
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index c2d591a..986faf1 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_CURLFTPFS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
 	help
-	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
-	  and libcurl.
+	  CurlFtpFS is a filesystem for accessing FTP hosts based on
+	  FUSE and libcurl.
 
 	  http://curlftpfs.sourceforge.net/
 
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index 0036961..e8f0606 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_CVS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_NCURSES
 	help
-	  Concurrent Versions System - source code revision control tools.
+	  Concurrent Versions System - source code revision control
+	  tools.
 
 	  http://www.nongnu.org/cvs/
 
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 03b7dbb..50c05eb 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
-	  A collection of Linux tools written in C for interfacing to the
-	  Nintendo Wiimote.
+	  A collection of Linux tools written in C for interfacing to
+	  the Nintendo Wiimote.
 
 	  http://abstrakraft.org/cwiid/
 
-- 
2.9.3
