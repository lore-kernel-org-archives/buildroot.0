From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Sep 2020 20:28:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libaacs: bump version to 0.11.0
Message-ID: <20200921182803.359197-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://code.videolan.org/videolan/libaacs/-/blob/master/ChangeLog

Added patch to fix build error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-read_file.h-include-sys-types.h.patch | 36 +++++++++++++++++++
 package/libaacs/libaacs.hash                  |  4 +--
 package/libaacs/libaacs.mk                    |  2 +-
 3 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 package/libaacs/0001-read_file.h-include-sys-types.h.patch

diff --git a/package/libaacs/0001-read_file.h-include-sys-types.h.patch b/package/libaacs/0001-read_file.h-include-sys-types.h.patch
new file mode 100644
index 0000000000..9bb1e04539
--- /dev/null
+++ b/package/libaacs/0001-read_file.h-include-sys-types.h.patch
@@ -0,0 +1,36 @@
+From 1fb08a352afada589f0b93af7a07c6fcd6da9bb8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 21 Sep 2020 20:19:38 +0200
+Subject: [PATCH] read_file.h: include sys/types.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error with uClibc and gcc-8.3.0:
+
+In file included from src/devtools/uk_dump.c:28:
+src/devtools/read_file.h:24:44: error: unknown type name ?off_t?
+ static size_t _read_file(const char *name, off_t min_size, off_t max_size, uint8_t **pdata)
+
+Upstream status: pending
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/devtools/read_file.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/devtools/read_file.h b/src/devtools/read_file.h
+index 953b2ef..a5d185c 100644
+--- a/src/devtools/read_file.h
++++ b/src/devtools/read_file.h
+@@ -19,6 +19,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <sys/types.h>
+ #include <errno.h>
+ 
+ static size_t _read_file(const char *name, off_t min_size, off_t max_size, uint8_t **pdata)
+-- 
+2.27.0
+
diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
index 82e8698616..62e389f2f9 100644
--- a/package/libaacs/libaacs.hash
+++ b/package/libaacs/libaacs.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libaacs/0.10.0/libaacs-0.10.0.tar.bz2.sha512
-sha512  4527749c3c78fd270012b3b36e916356a4aeb8f90169e781a00739f01f190121691042607209864e9b676ede9741f614c6003a7dfbb350dc020e1fa94cd6d66e  libaacs-0.10.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libaacs/0.11.0/libaacs-0.11.0.tar.bz2.sha512
+sha512  167edbb6f26599e41d6084908039bf902f69f57da1f64f1491734157d1568ad0b32c8ea3064e0706e383af8dc6007eef65170b2b47222bf3d363e395e0b60388  libaacs-0.11.0.tar.bz2
 
 # Hash for license file:
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
index 95f1cbdab8..3e0df18010 100644
--- a/package/libaacs/libaacs.mk
+++ b/package/libaacs/libaacs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAACS_VERSION = 0.10.0
+LIBAACS_VERSION = 0.11.0
 LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
 LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
 LIBAACS_LICENSE = LGPL-2.1+
-- 
2.27.0
