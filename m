From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:10:08 +0200
Subject: [Buildroot] [git commit] package/lib*: fix wrapping of Config.in
	help text
Message-ID: <20170731170652.F06127FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dccd7249e7dacceb370b0282592d504876e460e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
lib in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libao/Config.in                 |  3 ++-
 package/libcap-ng/Config.in             |  4 ++--
 package/libcoap/Config.in               | 11 ++++++-----
 package/libcofi/Config.in               |  3 ++-
 package/libcurl/Config.in               |  5 +++--
 package/libdmtx/Config.in               |  4 ++--
 package/libdnet/Config.in               |  3 ++-
 package/libdvbcsa/Config.in             |  8 +++++---
 package/libdvbpsi/Config.in             |  4 ++--
 package/libdvbsi/Config.in              |  7 ++++---
 package/libedit/Config.in               |  4 ++--
 package/libfastjson/Config.in           |  3 ++-
 package/libfreeglut/Config.in           |  6 +++---
 package/libglew/Config.in               | 11 ++++++-----
 package/libgtk3/Config.in               | 10 +++++-----
 package/libical/Config.in               |  4 ++--
 package/libiscsi/Config.in              | 11 ++++++-----
 package/liblinear/Config.in             |  4 ++--
 package/liblog4c-localtime/Config.in    |  4 ++--
 package/libmad/Config.in                |  6 +++---
 package/libmbim/Config.in               |  4 ++--
 package/libmbus/Config.in               |  4 ++--
 package/libmcrypt/Config.in             |  4 ++--
 package/libmhash/Config.in              |  4 ++--
 package/libminiupnpc/Config.in          |  4 ++--
 package/libmodbus/Config.in             |  6 +++---
 package/libmpdclient/Config.in          |  4 ++--
 package/libnetfilter_cthelper/Config.in |  4 ++--
 package/libnfc/Config.in                |  3 ++-
 package/liboauth/Config.in              |  7 ++++---
 package/libpcap/Config.in               |  3 ++-
 package/libphidget/Config.in            | 20 +++++++++++---------
 package/libplatform/Config.in           |  3 ++-
 package/libplayer/Config.in             |  6 +++---
 package/libpthsem/Config.in             |  4 ++--
 package/libqmi/Config.in                |  4 ++--
 package/librtas/Config.in               |  7 ++++---
 package/libseccomp/Config.in            | 13 +++++++------
 package/libsecret/Config.in             |  8 ++++----
 package/libserial/Config.in             |  4 ++--
 package/libshout/Config.in              |  7 ++++---
 package/libsidplay2/Config.in           |  9 +++++----
 package/libsigc/Config.in               |  8 ++++----
 package/libsndfile/Config.in            |  6 +++---
 package/libsysfs/Config.in              |  4 ++--
 package/libtheora/Config.in             |  4 ++--
 package/libtomcrypt/Config.in           |  8 ++++----
 package/libtool/Config.in               |  5 +++--
 package/libupnp/Config.in               |  9 +++++----
 package/libupnpp/Config.in              |  4 ++--
 package/liburcu/Config.in               |  4 ++--
 package/liburiparser/Config.in          |  4 ++--
 package/libv4l/Config.in                | 10 ++++++----
 package/libva/Config.in                 |  9 +++++----
 package/libvorbis/Config.in             | 15 ++++++++-------
 package/libzip/Config.in                |  5 +++--
 56 files changed, 185 insertions(+), 157 deletions(-)

diff --git a/package/libao/Config.in b/package/libao/Config.in
index 3c99ab9..1fab6d9 100644
--- a/package/libao/Config.in
+++ b/package/libao/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBAO
 	bool "libao"
 	help
 	  Libao is a cross-platform audio library that allows programs
-	  to output audio using a simple API on a wide variety of platforms.
+	  to output audio using a simple API on a wide variety of
+	  platforms.
 
 	  http://www.xiph.org/ao/
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index d1663cd..46f0b69 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBCAP_NG
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
 	  library. It includes utilities that can analyse all currently
-	  running applications and print out any capabilities and whether
-	  or not it has an open ended bounding set.
+	  running applications and print out any capabilities and
+	  whether or not it has an open ended bounding set.
 
 	  http://people.redhat.com/sgrubb/libcap-ng/
diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
index c089b55..6e0c190 100644
--- a/package/libcoap/Config.in
+++ b/package/libcoap/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LIBCOAP
 	bool "libcoap"
 	help
-	  libcoap is a C implementation of a lightweight application-protocol
-	  for devices that are constrained their resources such as computing
-	  power, RF range, memory, bandwith, or network packet sizes. This
-	  protocol, CoAP, is standardized by the IETF as RFC 7252. For further
-	  information related to CoAP, see <http://coap.technology>.
+	  libcoap is a C implementation of a lightweight
+	  application-protocol for devices that are constrained their
+	  resources such as computing power, RF range, memory, bandwith,
+	  or network packet sizes. This protocol, CoAP, is standardized
+	  by the IETF as RFC 7252. For further information related to
+	  CoAP, see <http://coap.technology>.
 
 	  https://github.com/obgm/libcoap
diff --git a/package/libcofi/Config.in b/package/libcofi/Config.in
index df9ab71..b9d22d4 100644
--- a/package/libcofi/Config.in
+++ b/package/libcofi/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_LIBCOFI
 	depends on !BR2_STATIC_LIBS
 	help
 	  A replacement for memcpy and memset functionality for the
-	  Raspberry Pi with the intention of gaining greater performance.
+	  Raspberry Pi with the intention of gaining greater
+	  performance.
 
 	  https://github.com/simonjhall/copies-and-fills
 
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index fc1527f..21c2ee2 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_LIBCURL
 	bool "libcurl"
 	help
-	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
-	  and Dict servers, using any of the supported protocols.
+	  cURL is a tool for getting files from FTP, HTTP, Gopher,
+	  Telnet, and Dict servers, using any of the supported
+	  protocols.
 
 	  http://curl.haxx.se/
 
diff --git a/package/libdmtx/Config.in b/package/libdmtx/Config.in
index db4187f..b81b99c 100644
--- a/package/libdmtx/Config.in
+++ b/package/libdmtx/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBDMTX
 	bool "libdmtx"
 	help
-	  libdmtx is a software library that enables programs to read and write
-	  Data Matrix barcodes of the modern ECC200 variety.
+	  libdmtx is a software library that enables programs to read
+	  and write Data Matrix barcodes of the modern ECC200 variety.
 
 	  http://www.libdmtx.org/
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index e78bded..e7ba3a2 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_LIBDNET
 	bool "libdnet"
 	help
-	  libdnet - simplified interface to low-level networking routines.
+	  libdnet - simplified interface to low-level networking
+	  routines.
 
 	  http://libdnet.sourceforge.net/
 
diff --git a/package/libdvbcsa/Config.in b/package/libdvbcsa/Config.in
index dd7dc15..1253ffb 100644
--- a/package/libdvbcsa/Config.in
+++ b/package/libdvbcsa/Config.in
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_LIBDVBCSA
 	bool "libdvbcsa"
 	help
-	  libdvbcsa is a free implementation of the DVB Common Scrambling
-	  Algorithm - DVB/CSA - with encryption and decryption capabilities
+	  libdvbcsa is a free implementation of the DVB Common
+	  Scrambling Algorithm - DVB/CSA - with encryption and
+	  decryption capabilities
 
-	  As libdvbcsa implements a standard, it is completely legal to use it.
+	  As libdvbcsa implements a standard, it is completely legal to
+	  use it.
 
 	  http://www.videolan.org/developers/libdvbcsa.html
diff --git a/package/libdvbpsi/Config.in b/package/libdvbpsi/Config.in
index 4d543bc..e52079b 100644
--- a/package/libdvbpsi/Config.in
+++ b/package/libdvbpsi/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_LIBDVBPSI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libdvbpsi is a simple library designed for decoding and
-	  generation of MPEG TS and DVB PSI tables according to standards
-	  ISO/IEC 13818 and ITU-T H.222.0.
+	  generation of MPEG TS and DVB PSI tables according to
+	  standards ISO/IEC 13818 and ITU-T H.222.0.
 
 	  http://www.videolan.org/developers/libdvbpsi.html
 
diff --git a/package/libdvbsi/Config.in b/package/libdvbsi/Config.in
index f67342d..fa0dcea 100644
--- a/package/libdvbsi/Config.in
+++ b/package/libdvbsi/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_LIBDVBSI
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  C++ parsing library for Service Information (SI) in DVB systems.
-	  With libdvbsi++ you can convert raw DVB service information to
-	  a set of C++ objects, removing the need to parse data manually.
+	  C++ parsing library for Service Information (SI) in DVB
+	  systems. With libdvbsi++ you can convert raw DVB service
+	  information to a set of C++ objects, removing the need to
+	  parse data manually.
 
 	  http://www.saftware.de/
 
diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 7c85014..8ccf3ed 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_LIBEDIT
 	  http://ftp.netbsd.org/pub/NetBSD/NetBSD-release-5-0/src/lib/libedit/
 
 	  Jess Thrysoee maintains an autotoolified package, which we use
-	  in Buildroot as it makes it much simpler than using the upstream
-	  sources which require pmake.
+	  in Buildroot as it makes it much simpler than using the
+	  upstream sources which require pmake.
 
 	  http://www.thrysoee.dk/editline
 
diff --git a/package/libfastjson/Config.in b/package/libfastjson/Config.in
index fbc9b1d..a3a7c80 100644
--- a/package/libfastjson/Config.in
+++ b/package/libfastjson/Config.in
@@ -10,7 +10,8 @@ config BR2_PACKAGE_LIBFASTJSON
 	  Its aim is to provide:
 
 	  - a small library with essential json handling functions
-	  - sufficiently good json support (not 100% standards compliant)
+	  - sufficiently good json support (not 100% standards
+	    compliant)
 	  - be very fast in processing
 
 	  https://github.com/rsyslog/libfastjson/
diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
index f7cd90b..ccb2d5c 100644
--- a/package/libfreeglut/Config.in
+++ b/package/libfreeglut/Config.in
@@ -9,9 +9,9 @@ config BR2_PACKAGE_LIBFREEGLUT
 	help
 	  FreeGLUT is a free-software/open-source alternative to the
 	  OpenGL Utility Toolkit (GLUT) library. GLUT (and hence
-	  FreeGLUT) takes care of all the system-specific chores required
-	  for creating windows, initializing OpenGL contexts, and
-	  handling input events, to allow for trully portable OpenGL
+	  FreeGLUT) takes care of all the system-specific chores
+	  required for creating windows, initializing OpenGL contexts,
+	  and handling input events, to allow for trully portable OpenGL
 	  programs.
 
 	  http://freeglut.sourceforge.net
diff --git a/package/libglew/Config.in b/package/libglew/Config.in
index 67c49d4..099c946 100644
--- a/package/libglew/Config.in
+++ b/package/libglew/Config.in
@@ -7,11 +7,12 @@ config BR2_PACKAGE_LIBGLEW
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  The OpenGL Extension Wrangler Library (GLEW) is a cross-platform C/C++
-	  extension loading library. GLEW provides efficient run-time mechanisms
-	  for determining which OpenGL extensions are supported on the target
-	  platform. OpenGL core and extension functionality is exposed in a
-	  single header file.
+	  The OpenGL Extension Wrangler Library (GLEW) is a
+	  cross-platform C/C++ extension loading library. GLEW provides
+	  efficient run-time mechanisms for determining which OpenGL
+	  extensions are supported on the target platform. OpenGL core
+	  and extension functionality is exposed in a single header
+	  file.
 
 	  http://glew.sourceforge.net
 
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 653f5dd..12e6470 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -42,13 +42,13 @@ config BR2_PACKAGE_LIBGTK3_BROADWAY
 	bool "Broadway GDK backend"
 	default y
 	  help
-	  This enables the Broadway backend for GDK, which provides support
-	  for displaying GTK+ applications in a web browser, using HTML5 and
-	  web sockets.
+	  This enables the Broadway backend for GDK, which provides
+	  support for displaying GTK+ applications in a web browser,
+	  using HTML5 and web sockets.
 
 	  For example, to run gtk3-demo on a target which IP address is
-	  192.168.0.1 and use it from a web browser, execute the following
-	  commands:
+	  192.168.0.1 and use it from a web browser, execute the
+	  following commands:
 
 	  $ broadwayd -a 192.168.0.1 -p 8080 :2 &
 	  $ export GDK_BACKEND=broadway
diff --git a/package/libical/Config.in b/package/libical/Config.in
index 3220d5b..7c1d4a1 100644
--- a/package/libical/Config.in
+++ b/package/libical/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_LIBICAL
 	depends on BR2_USE_WCHAR
 	select BR2_TARGET_TZ_INFO
 	help
-	  libical is an Open Source (MPL/LGPL) implementation of the IETF's
-	  iCalendar Calendaring and Scheduling protocols.
+	  libical is an Open Source (MPL/LGPL) implementation of the
+	  IETF's iCalendar Calendaring and Scheduling protocols.
 
 	  http://libical.github.io/libical
 
diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
index 88933f3..760fece 100644
--- a/package/libiscsi/Config.in
+++ b/package/libiscsi/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBISCSI
 	bool "libiscsi"
 	help
-	  Libiscsi is a client-side library to implement the iSCSI protocol
-	  that can be used to access resource of an iSCSI Target.
+	  Libiscsi is a client-side library to implement the iSCSI
+	  protocol that can be used to access resource of an iSCSI
+	  Target.
 
-	  The library is fully async with regards to iscsi commands and scsi
-	  tasks, but a sync layer is also provided for ease of use for simpler
-	  applications.
+	  The library is fully async with regards to iscsi commands and
+	  scsi tasks, but a sync layer is also provided for ease of use
+	  for simpler applications.
 
 	  https://github.com/sahlberg/libiscsi  (no proper homepage)
diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index f25c119..cabcba0 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBLINEAR
 	bool "liblinear"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  liblinear is a linear classifier for data with millions of instances
-	  and features.
+	  liblinear is a linear classifier for data with millions of
+	  instances and features.
 
 	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
 
diff --git a/package/liblog4c-localtime/Config.in b/package/liblog4c-localtime/Config.in
index a2b7a84..fd6cab8 100644
--- a/package/liblog4c-localtime/Config.in
+++ b/package/liblog4c-localtime/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_LIBLOG4C_LOCALTIME
 	help
 	  Log4c is a library of C for flexible logging to files, syslog
 	  and other destinations.
-	  This version is with localtime patch, to make lib show times in
-	  local timezone.
+	  This version is with localtime patch, to make lib show times
+	  in local timezone.
 
 	  https://github.com/rcmadruga/log4c-localtime
 	  http://log4c.sourceforge.net/
diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index c4feb72..1d6bdd8 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBMAD
 	bool "libmad"
 	help
-	  High-quality MPEG audio decoder. All computations are performed
-	  with fixed-point integer arithmetic, making it ideal for systems
-	  without a floating-point unit.
+	  High-quality MPEG audio decoder. All computations are
+	  performed with fixed-point integer arithmetic, making it ideal
+	  for systems without a floating-point unit.
 
 	  http://www.underbit.com/products/mad/
 
diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index 0ef28db..4f80592 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_LIBMBIM
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libmbim is a glib-based library for talking to WWAN modems and
-	  devices which speak the Mobile Interface Broadband Model (MBIM)
-	  protocol.
+	  devices which speak the Mobile Interface Broadband Model
+	  (MBIM) protocol.
 
 	  http://www.freedesktop.org/wiki/Software/libmbim/
 
diff --git a/package/libmbus/Config.in b/package/libmbus/Config.in
index 8614069..ae3e85c 100644
--- a/package/libmbus/Config.in
+++ b/package/libmbus/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBMBUS
 	bool "libmbus"
 	help
-	  libmbus is a library for communicating with energy metering devices.
-	  It supports TCP and RS232 M-bus gateways.
+	  libmbus is a library for communicating with energy metering
+	  devices. It supports TCP and RS232 M-bus gateways.
 	  (M-bus standard: http://www.m-bus.com/)
 
 	  http://www.rscada.se/libmbus/
diff --git a/package/libmcrypt/Config.in b/package/libmcrypt/Config.in
index e5dc5e2..784d2c2 100644
--- a/package/libmcrypt/Config.in
+++ b/package/libmcrypt/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBMCRYPT
 	bool "libmcrypt"
 	help
-	  libmcrypt is a library that provides uniform interface to access
-	  several encryption algorithms.
+	  libmcrypt is a library that provides uniform interface to
+	  access several encryption algorithms.
 
 	  http://mcrypt.sourceforge.net/
diff --git a/package/libmhash/Config.in b/package/libmhash/Config.in
index a9bd51a..774ff1b 100644
--- a/package/libmhash/Config.in
+++ b/package/libmhash/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBMHASH
 	help
 	  Mhash is a free (under GNU Lesser GPL) library which provides
 	  a uniform interface to a large number of hash algorithms.
-	  These algorithms can be used to compute checksums, message digests,
-	  and other signatures.
+	  These algorithms can be used to compute checksums, message
+	  digests, and other signatures.
 
 	  http://mhash.sourceforge.net/
diff --git a/package/libminiupnpc/Config.in b/package/libminiupnpc/Config.in
index c241707..a3410a0 100644
--- a/package/libminiupnpc/Config.in
+++ b/package/libminiupnpc/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_LIBMINIUPNPC
 	depends on !BR2_STATIC_LIBS
 	help
 	  The UPnP protocol is supported by most home adsl/cable routers
-	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project is
-	  to bring a free software solution to support the "Internet
+	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project
+	  is to bring a free software solution to support the "Internet
 	  Gateway Device" part of the protocol.
 
 	  Miniupnpc aims at the simplest library possible, with the
diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
index ccf1190..642b57c 100644
--- a/package/libmodbus/Config.in
+++ b/package/libmodbus/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBMODBUS
 	bool "libmodbus"
 	help
-	  libmodbus is a free software library to send/receive data according
-	  to the Modbus protocol. This library is written in C and supports
-	  RTU (serial) and TCP (Ethernet) communications.
+	  libmodbus is a free software library to send/receive data
+	  according to the Modbus protocol. This library is written in C
+	  and supports RTU (serial) and TCP (Ethernet) communications.
 
 	  http://libmodbus.org
diff --git a/package/libmpdclient/Config.in b/package/libmpdclient/Config.in
index a58c6c3..ba0df56 100644
--- a/package/libmpdclient/Config.in
+++ b/package/libmpdclient/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBMPDCLIENT
 	bool "libmpdclient"
 	help
-	  A stable, documented, asynchronous API library for interfacing MPD
-	  in the C, C++ & Objective C languages.
+	  A stable, documented, asynchronous API library for interfacing
+	  MPD in the C, C++ & Objective C languages.
 
 	  http://www.musicpd.org/libs/libmpdclient/
diff --git a/package/libnetfilter_cthelper/Config.in b/package/libnetfilter_cthelper/Config.in
index 571883d..8d9b1dd 100644
--- a/package/libnetfilter_cthelper/Config.in
+++ b/package/libnetfilter_cthelper/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	select BR2_PACKAGE_LIBMNL
 	help
 	  libnetfilter_cthelper is the userspace library that provides
-	  the programming interface to the user-space helper infrastructure
-	  available since Linux kernel 3.6.
+	  the programming interface to the user-space helper
+	  infrastructure available since Linux kernel 3.6.
 
 	  http://www.netfilter.org/projects/libnetfilter_cthelper/
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 1707f21..c8fe251 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_LIBNFC
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
-	  Public platform independent Near Field Communication (NFC) library.
+	  Public platform independent Near Field Communication (NFC)
+	  library.
 
 	  http://www.libnfc.org/
 
diff --git a/package/liboauth/Config.in b/package/liboauth/Config.in
index 77a78f1..4ed0efa 100644
--- a/package/liboauth/Config.in
+++ b/package/liboauth/Config.in
@@ -3,8 +3,9 @@ config BR2_PACKAGE_LIBOAUTH
 	select BR2_PACKAGE_OPENSSL
 	help
 	  liboauth is a collection of c functions implementing the oAuth
-	  Core 1.0 Rev A standard API. liboauth provides basic functions to
-	  escape and encode parameters according to oAuth specs and offers
-	  high-level functions to sign requests or verify signatures.
+	  Core 1.0 Rev A standard API. liboauth provides basic functions
+	  to escape and encode parameters according to oAuth specs and
+	  offers high-level functions to sign requests or verify
+	  signatures.
 
 	  http://liboauth.sourceforge.net/
diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
index 7f9517a..643acbe 100644
--- a/package/libpcap/Config.in
+++ b/package/libpcap/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBPCAP
 	bool "libpcap"
 	select BR2_PACKAGE_ZLIB
 	help
-	  A system-independent library for user-level network packet capture.
+	  A system-independent library for user-level network packet
+	  capture.
 
 	  http://www.tcpdump.org/
diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
index 7466fb5..61e9154 100644
--- a/package/libphidget/Config.in
+++ b/package/libphidget/Config.in
@@ -4,20 +4,22 @@ config BR2_PACKAGE_LIBPHIDGET
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBUSB
 	help
-	  The libphidget library provides an API for controlling Phidgets
-	  USB devices. The library translates API function calls to libusb
-	  function calls to control attached Phidgets devices that provide
-	  GPIO's, DAC's, accelerometers, servo motors, and other capabilities
-	  either singly or on combo devices.
+	  The libphidget library provides an API for controlling
+	  Phidgets USB devices. The library translates API function
+	  calls to libusb function calls to control attached Phidgets
+	  devices that provide GPIO's, DAC's, accelerometers, servo
+	  motors, and other capabilities either singly or on combo
+	  devices.
 
 	  To use libphidget for controlling locally attached devices you
 	  need to set up the userspace USB device tree /dev/bus/usb. See
 	  file udev/99-phidgets.rules.
 
-	  The libphidget library also contains an API for sending commands
-	  to a local or remote phidgetwebservice using HTTP. The
-	  phidgetwebservice then translates HTTP requests to libphidget API
-	  function calls to control locally attached Phidgets devices.
+	  The libphidget library also contains an API for sending
+	  commands to a local or remote phidgetwebservice using HTTP.
+	  The phidgetwebservice then translates HTTP requests to
+	  libphidget API function calls to control locally attached
+	  Phidgets devices.
 
 	  http://phidgets.com/
 
diff --git a/package/libplatform/Config.in b/package/libplatform/Config.in
index 7d275b1..ade6baf 100644
--- a/package/libplatform/Config.in
+++ b/package/libplatform/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPLATFORM
 	bool
 	help
-	  Platform support library used by libCEC and binary add-ons for Kodi
+	  Platform support library used by libCEC and binary add-ons for
+	  Kodi
 
 	  https://github.com/Pulse-Eight/platform
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index e1e04a1..0ae558d 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_LIBPLAYER
 	bool "libplayer"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  libplayer provides a generic A/V API that relies on various multimedia
-	  player for Linux systems. It currently supports MPlayer, xine VLC and
-	  GStreamer only
+	  libplayer provides a generic A/V API that relies on various
+	  multimedia player for Linux systems. It currently supports
+	  MPlayer, xine VLC and GStreamer only
 
 	  http://libplayer.geexbox.org/
 
diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index 3219de1..c2856c5 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBPTHSEM
 	bool "libpthsem"
 	depends on BR2_USE_MMU # fork()
 	help
-	  GNU pth is a user mode multi threading library. pthsem is an extend
-	  version, with support for semaphores added.
+	  GNU pth is a user mode multi threading library. pthsem is an
+	  extend version, with support for semaphores added.
 
 	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
 
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index cfb0ecd..f1d111b 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_LIBQMI
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  libqmi is a glib-based library for talking to WWAN modems and devices
-	  which speak the Qualcomm MSM Interface (QMI) protocol.
+	  libqmi is a glib-based library for talking to WWAN modems and
+	  devices which speak the Qualcomm MSM Interface (QMI) protocol.
 
 	  http://www.freedesktop.org/wiki/Software/libqmi/
 
diff --git a/package/librtas/Config.in b/package/librtas/Config.in
index fb0ac76..11660eb 100644
--- a/package/librtas/Config.in
+++ b/package/librtas/Config.in
@@ -3,9 +3,10 @@ config BR2_PACKAGE_LIBRTAS
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
-	  The librtas package provides an interface for Run-Time Abstraction
-	  Services (RTAS) calls on PAPR platforms. The libraries allow users to
-	  examine and manipulate hardware, and parse RTAS events.
+	  The librtas package provides an interface for Run-Time
+	  Abstraction Services (RTAS) calls on PAPR platforms.
+	  The libraries allow users to examine and manipulate hardware,
+	  and parse RTAS events.
 
 	  http://librtas.sourceforge.net/
 
diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index 559beda..d3b4bb8 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -13,12 +13,13 @@ config BR2_PACKAGE_LIBSECCOMP
 	help
 	  High level interface to the Linux Kernel's seccomp filter
 
-	  The libseccomp library provides an easy to use, platform independent,
-	  interface to the Linux Kernel's syscall filtering mechanism: seccomp.
-	  The libseccomp API is designed to abstract away the underlying BPF
-	  based syscall filter language and present a more conventional
-	  function-call based filtering interface that should be familiar to,
-	  and easily adopted by application developers.
+	  The libseccomp library provides an easy to use, platform
+	  independent, interface to the Linux Kernel's syscall filtering
+	  mechanism: seccomp. The libseccomp API is designed to abstract
+	  away the underlying BPF based syscall filter language and
+	  present a more conventional function-call based filtering
+	  interface that should be familiar to, and easily adopted by
+	  application developers.
 
 	  https://github.com/seccomp/libseccomp
 
diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index a8de8f8..0539e5d 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -5,10 +5,10 @@ config BR2_PACKAGE_LIBSECRET
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  libsecret is a library for storing and retrieving passwords and other
-	  secrets. It communicates with the "Secret Service" using DBus.
-	  gnome-keyring and ksecretservice are both implementations of a Secret
-	  Service.
+	  libsecret is a library for storing and retrieving passwords
+	  and other secrets. It communicates with the "Secret Service"
+	  using DBus. gnome-keyring and ksecretservice are both
+	  implementations of a Secret Service.
 
 	  https://wiki.gnome.org/Libsecret
 
diff --git a/package/libserial/Config.in b/package/libserial/Config.in
index bd936b9..d492f6b 100644
--- a/package/libserial/Config.in
+++ b/package/libserial/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_LIBSERIAL
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	help
-	  Simplified serial port programming in C++ under POSIX operating
-	  systems.
+	  Simplified serial port programming in C++ under POSIX
+	  operating systems.
 
 	  http://libserial.sourceforge.net/
 
diff --git a/package/libshout/Config.in b/package/libshout/Config.in
index 02248c7..f8749b9 100644
--- a/package/libshout/Config.in
+++ b/package/libshout/Config.in
@@ -3,8 +3,9 @@ config BR2_PACKAGE_LIBSHOUT
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
 	help
-	  Libshout is a library for communicating with and sending data to an
-	  icecast server. It handles the socket connection, the timing of the
-	  data, and prevents bad data from getting to the icecast server.
+	  Libshout is a library for communicating with and sending data
+	  to an icecast server. It handles the socket connection, the
+	  timing of the data, and prevents bad data from getting to the
+	  icecast server.
 
 	  http://icecast.org/download/
diff --git a/package/libsidplay2/Config.in b/package/libsidplay2/Config.in
index 5698367..1bbe49b 100644
--- a/package/libsidplay2/Config.in
+++ b/package/libsidplay2/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_LIBSIDPLAY2
 	bool "libsidplay2"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  Sidplay 2 is the second in the Sidplay series originally developed by
-	  Michael Schwendt. This version is written by Simon White and is cycle
-	  accurate for improved sound reproduction. Sidplay 2 is capable of
-	  playing all C64 mono and stereo file formats.
+	  Sidplay 2 is the second in the Sidplay series originally
+	  developed by Michael Schwendt. This version is written by
+	  Simon White and is cycle accurate for improved sound
+	  reproduction. Sidplay 2 is capable of playing all C64 mono and
+	  stereo file formats.
 
 	  http://sourceforge.net/projects/sidplay2
 
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index f38749b..4bd762e 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_LIBSIGC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  libsigc++ implements a typesafe callback system for standard C++.
-	  It allows you to define signals and to connect those signals to
-	  any callback function, either global or a member function,
-	  regardless of whether it is static or virtual.
+	  libsigc++ implements a typesafe callback system for standard
+	  C++. It allows you to define signals and to connect those
+	  signals to any callback function, either global or a member
+	  function, regardless of whether it is static or virtual.
 
 	  http://libsigc.sourceforge.net/
 
diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 9afe496..4ccf937 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBSNDFILE
 	bool "libsndfile"
 	help
-	  Libsndfile is a C library for reading and writing files containing
-	  sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
-	  through one standard library interface.
+	  Libsndfile is a C library for reading and writing files
+	  containing sampled sound (such as MS Windows WAV and the
+	  Apple/SGI AIFF format) through one standard library interface.
 
 	  http://www.mega-nerd.com/libsndfile/
diff --git a/package/libsysfs/Config.in b/package/libsysfs/Config.in
index e4e6f28..134812e 100644
--- a/package/libsysfs/Config.in
+++ b/package/libsysfs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBSYSFS
 	bool "libsysfs"
 	help
-	These are a set of utilities built upon sysfs, a filesystem in
-	Linux 2.6 kernels that exposes a system's device tree.
+	  These are a set of utilities built upon sysfs, a filesystem in
+	  Linux 2.6 kernels that exposes a system's device tree.
 
 	http://linux-diag.sourceforge.net/Sysfsutils.html
diff --git a/package/libtheora/Config.in b/package/libtheora/Config.in
index bf20a50..eee9e9b 100644
--- a/package/libtheora/Config.in
+++ b/package/libtheora/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBTHEORA
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
 	help
-	  A library for the free and open video compression format "Theora"
-	  from the Xiph.org Foundation.
+	  A library for the free and open video compression format
+	  "Theora" from the Xiph.org Foundation.
 
 	  http://www.theora.org/
diff --git a/package/libtomcrypt/Config.in b/package/libtomcrypt/Config.in
index 6678b30..a7c5f50 100644
--- a/package/libtomcrypt/Config.in
+++ b/package/libtomcrypt/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_LIBTOMCRYPT
 	select BR2_PACKAGE_LIBTOMMATH
 	help
 	  LibTomCrypt is a fairly comprehensive, modular and portable
-	  cryptographic toolkit that provides developers with a vast array
-	  of well known published block ciphers, one-way hash functions,
-	  chaining modes, pseudo-random number generators, public key
-	  cryptography and a plethora of other routines.
+	  cryptographic toolkit that provides developers with a vast
+	  array of well known published block ciphers, one-way hash
+	  functions, chaining modes, pseudo-random number generators,
+	  public key cryptography and a plethora of other routines.
 
 	  http://www.libtom.net
diff --git a/package/libtool/Config.in b/package/libtool/Config.in
index d3cf2d7..8192c77 100644
--- a/package/libtool/Config.in
+++ b/package/libtool/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_LIBTOOL
 	bool "libtool"
 	help
-	  Library that hides the complexity of using shared/static libraries
-	  on different platforms behind a consistent, portable interface.
+	  Library that hides the complexity of using shared/static
+	  libraries on different platforms behind a consistent, portable
+	  interface.
 
 	  http://www.gnu.org/software/libtool/
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 6a07b42..7c6c376 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_LIBUPNP
 	bool "libupnp"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
-	  with an API and open source code for building control points,
-	  devices, and bridges that are compliant with Version 1.0 of the
-	  Universal Plug and Play Device Architecture Specification
+	  The portable SDK for UPnP(tm) Devices (libupnp) provides
+	  developers with an API and open source code for building
+	  control points, devices, and bridges that are compliant with
+	  Version 1.0 of the Universal Plug and Play Device Architecture
+	  Specification
 
 	  http://pupnp.sourceforge.net/
 
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 84393f6..32877ff 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_LIBUPNPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBUPNP
 	help
-	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
-	  upplay.
+	  The libupnpp C++ library wraps libupnp for easier use by
+	  upmpdcli and upplay.
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 4330255..2598181 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -16,8 +16,8 @@ config BR2_PACKAGE_LIBURCU
 
 	  On ARM, because of bug:
 	    http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
-	  liburcu cannot be built using gcc 4.8.0, 4.8.1 or 4.8.2 without the
-	  following bug fix:
+	  liburcu cannot be built using gcc 4.8.0, 4.8.1 or 4.8.2
+	  without the following bug fix:
 	    http://gcc.gnu.org/viewcvs/gcc?view=revision&revision=204665
 
 	  http://lttng.org/urcu
diff --git a/package/liburiparser/Config.in b/package/liburiparser/Config.in
index 95a6fe8..e85a262 100644
--- a/package/liburiparser/Config.in
+++ b/package/liburiparser/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBURIPARSER
 	bool "liburiparser"
 	help
-	  uriparser is a strictly RFC 3986 compliant URI parsing and handling
-	  library written in C.
+	  uriparser is a strictly RFC 3986 compliant URI parsing and
+	  handling library written in C.
 
 	  http://uriparser.sourceforge.net
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index e7f78dc..57ddde1 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_LIBV4L
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-	  libv4l is a collection of libraries which adds a thin abstraction
-	  layer on top of video4linux2 devices. libv4l consists of 3 different
-	  libraries: libv4lconvert, libv4l1 and libv4l2.
+	  libv4l is a collection of libraries which adds a thin
+	  abstraction layer on top of video4linux2 devices. libv4l
+	  consists of 3 different libraries: libv4lconvert, libv4l1 and
+	  libv4l2.
 
 	  http://linuxtv.org/wiki/index.php/V4l-utils
 
@@ -20,7 +21,8 @@ comment "libv4l JPEG support not enabled"
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
 	help
-	  v4l-utils is a collection of various video4linux and DVB utilities.
+	  v4l-utils is a collection of various video4linux and DVB
+	  utilities.
 	  Enable this if you want to build the following tools:
 	  - cx18-ctl
 	  - dvb-fe-tool, dvbv5-zap, dvbv5-scan, dvb-format-convert
diff --git a/package/libva/Config.in b/package/libva/Config.in
index 048e4c9..08eb16b 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -7,10 +7,11 @@ config BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	help
-	  The main motivation for VA-API (Video Acceleration API) is to enable
-	  hardware accelerated video decode/encode at various entry-points (VLD,
-	  IDCT, Motion Compensation etc.) for the prevailing coding standards
-	  today (MPEG-2, MPEG-4 ASP/H.263, MPEG-4 AVC/H.264, and VC-1/VMW3).
+	  The main motivation for VA-API (Video Acceleration API) is to
+	  enable hardware accelerated video decode/encode at various
+	  entry-points (VLD, IDCT, Motion Compensation etc.) for the
+	  prevailing coding standards today (MPEG-2, MPEG-4 ASP/H.263,
+	  MPEG-4 AVC/H.264, and VC-1/VMW3).
 
 	  https://01.org/linuxmedia/vaapi
 
diff --git a/package/libvorbis/Config.in b/package/libvorbis/Config.in
index e322dd2..3d5b5d6 100644
--- a/package/libvorbis/Config.in
+++ b/package/libvorbis/Config.in
@@ -3,12 +3,13 @@ config BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBOGG
 	help
 	  Library for the Vorbis open source audio decoder
-	  Ogg Vorbis is a fully open, non-proprietary, patent-and-royalty-free,
-	  general-purpose compressed audio format for mid to high quality
-	  (8kHz-48.0kHz, 16+ bit, polyphonic) audio and music at fixed and
-	  variable bitrates from 16 to 128 kbps/channel.
+	  Ogg Vorbis is a fully open, non-proprietary,
+	  patent-and-royalty-free, general-purpose compressed audio
+	  format for mid to high quality (8kHz-48.0kHz, 16+ bit,
+	  polyphonic) audio and music at fixed and variable bitrates
+	  from 16 to 128 kbps/channel.
 
 	  This places Vorbis in the same competitive class as audio
-	  representations such as MPEG-4 (AAC), and similar to, but higher
-	  performance than MPEG-1/2 audio layer 3, MPEG-4 audio (TwinVQ),
-	  WMA and PAC.
+	  representations such as MPEG-4 (AAC), and similar to, but
+	  higher performance than MPEG-1/2 audio layer 3, MPEG-4 audio
+	  (TwinVQ), WMA and PAC.
diff --git a/package/libzip/Config.in b/package/libzip/Config.in
index 6c952ac..f69dd0d 100644
--- a/package/libzip/Config.in
+++ b/package/libzip/Config.in
@@ -3,8 +3,9 @@ config BR2_PACKAGE_LIBZIP
 	depends on !BR2_STATIC_LIBS # dlsym()
 	select BR2_PACKAGE_ZLIB
 	help
-	  C library for reading, creating, and modifying zip archives. This
-	  package also contains zipcmp, ziptorrent and zipmerge utilities.
+	  C library for reading, creating, and modifying zip archives.
+	  This package also contains zipcmp, ziptorrent and zipmerge
+	  utilities.
 
 	  http://www.nih.at/libzip/
 
