From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 15:49:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/dmidecode: bump to version 3.3
Message-ID: <20201025144934.1290100-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (not needed since
  http://git.savannah.nongnu.org/cgit/dmidecode.git/commit?id=5b3c8e9950262fc941bb5b3b3a1275720d47d62d)
- Update indentation in hash file (two spaces)

http://git.savannah.gnu.org/cgit/dmidecode.git/plain/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../dmidecode/0001-build-system-fixes.patch   | 35 -------------------
 package/dmidecode/dmidecode.hash              |  4 +--
 package/dmidecode/dmidecode.mk                |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/dmidecode/0001-build-system-fixes.patch

diff --git a/package/dmidecode/0001-build-system-fixes.patch b/package/dmidecode/0001-build-system-fixes.patch
deleted file mode 100644
index 00897f82ad..0000000000
--- a/package/dmidecode/0001-build-system-fixes.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Minor build system fixes
-
-Usual build system fixes to allow CC/CFLAGS/LDFLAGS to be overriden
-from the command line, and completed by additional flags from the
-Makefile.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -12,9 +12,10 @@
- #   (at your option) any later version.
- #
- 
--CC      = gcc
--CFLAGS  = -W -Wall -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-qual \
--          -Wcast-align -Wwrite-strings -Wmissing-prototypes -Winline -Wundef
-+CC      ?= gcc
-+override CFLAGS  += \
-+	-W -Wall -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-qual \
-+        -Wcast-align -Wwrite-strings -Wmissing-prototypes -Winline -Wundef
- 
- # Let lseek and mmap support 64-bit wide offsets
- CFLAGS += -D_FILE_OFFSET_BITS=64
-@@ -27,7 +28,7 @@ CFLAGS += -O2
- #CFLAGS += -g
- 
- # Pass linker flags here
--LDFLAGS =
-+override LDFLAGS +=
- 
- DESTDIR =
- prefix  = /usr/local
diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index c6edf4bcac..ba72295cae 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 077006fa2da0d06d6383728112f2edef9684e9c8da56752e97cd45a11f838edd  dmidecode-3.2.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  82c737a780614c38a783e8055340d295e332fb12c7f418b5d21a0797d3fb1455  dmidecode-3.3.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 811565d8e4..89d9155f95 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.2
+DMIDECODE_VERSION = 3.3
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
-- 
2.28.0
