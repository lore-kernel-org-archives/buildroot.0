From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:25:00 +0200
Subject: [Buildroot] [git commit branch/next] package/a*/Config.in: fix help
	text wrapping
Message-ID: <20170511212531.D2C2E8292A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0896e3ed644a37bde3b7ad7786f0f7b4df7d25a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The check-package script when ran gives warnings on text wrapping on all
of these Config files. This patch cleans up all warnings related to the
text wrapping for the Config files starting with the letter a in the
package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/a10disp/Config.in   |  4 ++--
 package/acpid/Config.in     |  5 +++--
 package/aespipe/Config.in   |  9 +++++----
 package/agentpp/Config.in   | 15 ++++++++-------
 package/alsa-lib/Config.in  |  4 ++--
 package/apache/Config.in    | 11 ++++++-----
 package/apr/Config.in       |  7 ++++---
 package/assimp/Config.in    |  7 ++++---
 package/aubio/Config.in     |  8 ++++----
 package/aufs-util/Config.in |  3 ++-
 package/autossh/Config.in   |  3 ++-
 11 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/package/a10disp/Config.in b/package/a10disp/Config.in
index 18e2d8f..99ae0aa 100644
--- a/package/a10disp/Config.in
+++ b/package/a10disp/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_A10DISP
 	depends on BR2_arm
 	depends on BR2_LINUX_KERNEL
 	help
-	  Program to change the display mode of Allwinner ARM SOCs running
-	  the linux-sunxi kernel (and not the mainline kernel.)
+	  Program to change the display mode of Allwinner ARM SOCs
+	  running the linux-sunxi kernel (and not the mainline kernel.)
 
 	  http://github.com/hglm/a10disp
 
diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index 5aec7f1..2bd83ea 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_ACPID
 	help
 	  Advanced Configuration and Power Interface event daemon.
 
-	  Acpid is designed to notify user-space programs of ACPI events,
-	  and allows you to configure specific actions for specific events.
+	  Acpid is designed to notify user-space programs of ACPI
+	  events, and allows you to configure specific actions for
+	  specific events.
 
 	  http://sourceforge.net/projects/acpid2/
diff --git a/package/aespipe/Config.in b/package/aespipe/Config.in
index df99523..2c2ff5c 100644
--- a/package/aespipe/Config.in
+++ b/package/aespipe/Config.in
@@ -2,9 +2,10 @@ config BR2_PACKAGE_AESPIPE
 	bool "aespipe"
 	depends on BR2_USE_MMU # fork()
 	help
-	  aespipe program is AES encrypting or decrypting pipe. It reads from
-	  standard input and writes to standard output. It can be used to
-	  create and restore encrypted tar or cpio archives. It can be used to
-	  encrypt and decrypt loop-AES compatible encrypted disk images.
+	  aespipe program is AES encrypting or decrypting pipe. It reads
+	  from standard input and writes to standard output. It can be
+	  used to create and restore encrypted tar or cpio archives.
+	  It can be used to encrypt and decrypt loop-AES compatible
+	  encrypted disk images.
 
 	  http://koti.tnnet.fi/jari.ruusu/linux/
diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index e591fb5..9e6eeed 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -5,13 +5,14 @@ config BR2_PACKAGE_AGENTPP
 	depends on !BR2_STATIC_LIBS # snmp++
 	select BR2_PACKAGE_SNMPPP
 	help
-	  AGENT++ is a set of C++ classes which provides a complete protocol
-	  engine and dispatch table for the development of SNMP agents.
-	  AGENT++ is a multilingual API which supports SNMPv1, SNMPv2c, and
-	  SNMPv3. It provides various C++ classes implementing prototypes for
-	  scalar and table SNMP managed objects that can be customized by
-	  derivation. Additional classes support the development of proxy
-	  agents as well as sending notifications.
+	  AGENT++ is a set of C++ classes which provides a complete
+	  protocol engine and dispatch table for the development of SNMP
+	  agents. AGENT++ is a multilingual API which supports SNMPv1,
+	  SNMPv2c, and SNMPv3. It provides various C++ classes
+	  implementing prototypes for scalar and table SNMP managed
+	  objects that can be customized by derivation. Additional
+	  classes support the development of proxy agents as well as
+	  sending notifications.
 
 	  SNMPv3 support is enabled if SNMP++ enables it.
 
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index c355b2c..995d379 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -13,8 +13,8 @@ menuconfig BR2_PACKAGE_ALSA_LIB
 	# is fixed
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	help
-	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
-	  functionality to the Linux operating system.
+	  The Advanced Linux Sound Architecture (ALSA) provides audio
+	  and MIDI functionality to the Linux operating system.
 
 	  http://www.alsa-project.org/
 
diff --git a/package/apache/Config.in b/package/apache/Config.in
index 5916d30..693ee20 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -6,11 +6,12 @@ config BR2_PACKAGE_APACHE
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_PCRE
 	help
-	  The Apache HTTP Server Project is an effort to develop and maintain an
-	  open-source HTTP server for modern operating systems including UNIX
-	  and Windows NT. The goal of this project is to provide a secure,
-	  efficient and extensible server that provides HTTP services in sync
-	  with the current HTTP standards.
+	  The Apache HTTP Server Project is an effort to develop and
+	  maintain an open-source HTTP server for modern operating
+	  systems including UNIX and Windows NT. The goal of this
+	  project is to provide a secure, efficient and extensible
+	  server that provides HTTP services in sync with the current
+	  HTTP standards.
 
 	  http://httpd.apache.org
 
diff --git a/package/apr/Config.in b/package/apr/Config.in
index 5757272..67de925 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_APR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork() in apr_proc_fork()
 	help
-	  The mission of the Apache Portable Runtime (APR) project is to create
-	  and maintain software libraries that provide a predictable and
-	  consistent interface to underlying platform-specific implementations
+	  The mission of the Apache Portable Runtime (APR) project is to
+	  create and maintain software libraries that provide a
+	  predictable and consistent interface to underlying
+	  platform-specific implementations
 
 	  http://apr.apache.org/
 
diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 93020f7..41c1bb3 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -8,9 +8,10 @@ config BR2_PACKAGE_ASSIMP
 	select BR2_PACKAGE_ZLIB
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
-	  library to import various well-known 3D model formats in a uniform
-	  manner. The most recent version also knows how to export 3d files
-	  and is therefore suitable as a general-purpose 3D model converter.
+	  library to import various well-known 3D model formats in a
+	  uniform manner. The most recent version also knows how to
+	  export 3d files and is therefore suitable as a general-purpose
+	  3D model converter.
 
 	  http://www.assimp.org
 
diff --git a/package/aubio/Config.in b/package/aubio/Config.in
index c4c60db..18e7c4c 100644
--- a/package/aubio/Config.in
+++ b/package/aubio/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_AUBIO
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  aubio is a tool designed for the extraction of annotations from
-	  audio signals. Its features include segmenting a sound file
-	  before each of its attacks, performing pitch detection, tapping
-	  the beat and producing midi streams from live audio.
+	  aubio is a tool designed for the extraction of annotations
+	  from audio signals. Its features include segmenting a sound
+	  file before each of its attacks, performing pitch detection,
+	  tapping the beat and producing midi streams from live audio.
 
 	  Because these tasks are difficult, we thought it was important
 	  to gather them in a dedicated library. To increase the fun, we
diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
index 93999fb..89b1f42 100644
--- a/package/aufs-util/Config.in
+++ b/package/aufs-util/Config.in
@@ -28,7 +28,8 @@ config BR2_PACKAGE_AUFS_UTIL_VERSION
 	  Usually, the sha1 of the cset you want to use; avoid using a
 	  branch name as this yields non-reproducible builds.
 
-	  See the following resources to see what versions are available:
+	  See the following resources to see what versions are 
+	  available:
 
 	  https://sourceforge.net/p/aufs/aufs-util/ci/master/tree/
 
diff --git a/package/autossh/Config.in b/package/autossh/Config.in
index 6d1a085..351e23f 100644
--- a/package/autossh/Config.in
+++ b/package/autossh/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_AUTOSSH
 	depends on BR2_PACKAGE_DROPBEAR || BR2_PACKAGE_OPENSSH
 	help
 	  autossh is a program to start a copy of ssh and monitor it,
-	  restarting it as necessary should it die or stop passing traffic.
+	  restarting it as necessary should it die or stop passing
+	  traffic.
 
 	  http://www.harding.motd.ca/autossh/
