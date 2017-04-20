From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:28:17 +0200
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2.2
Message-ID: <20170420202835.A5CC4802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33481124c7913fbdaee327afd97fd8ba138434e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0001 applied upstream:
https://github.com/gentoo/eudev/commit/c0f63850ad29ec978d070a08b816dc2bfca337e3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-missing-defines-for-old-kernels.patch     | 44 ----------------------
 package/eudev/eudev.hash                           |  4 +-
 package/eudev/eudev.mk                             |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/package/eudev/0002-missing-defines-for-old-kernels.patch b/package/eudev/0002-missing-defines-for-old-kernels.patch
deleted file mode 100644
index 6966b07..0000000
--- a/package/eudev/0002-missing-defines-for-old-kernels.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c0f63850ad29ec978d070a08b816dc2bfca337e3 Mon Sep 17 00:00:00 2001
-From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
-Date: Fri, 30 Dec 2016 11:28:41 -0200
-Subject: [PATCH] udev-builtin-input_id.c: add missing kernel header defines.
-
-Add missing defines so eudev builds for older kernels such as 2.6
-
-Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
----
- src/shared/missing.h             | 8 ++++++++
- src/udev/udev-builtin-input_id.c | 1 +
- 2 files changed, 9 insertions(+)
-
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index 5ad599795..bebbb42be 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -171,3 +171,11 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
-     (char *)memcpy(__new, __old, __len); \
-   })
- #endif
-+
-+#ifndef BTN_TRIGGER_HAPPY
-+#define BTN_TRIGGER_HAPPY 0x2c0
-+#endif
-+
-+#ifndef INPUT_PROP_MAX
-+#define INPUT_PROP_MAX 0x1f
-+#endif
-diff --git a/src/udev/udev-builtin-input_id.c b/src/udev/udev-builtin-input_id.c
-index b14190e42..ca545be5d 100644
---- a/src/udev/udev-builtin-input_id.c
-+++ b/src/udev/udev-builtin-input_id.c
-@@ -32,6 +32,7 @@
- 
- #include "udev.h"
- #include "util.h"
-+#include "missing.h"
- 
- /* we must use this kernel-compatible implementation */
- #define BITS_PER_LONG (sizeof(unsigned long) * 8)
--- 
-2.11.0
-
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 108b0c6..cda1a8d 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,4 +1,4 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 49f71f6c271ffa95b3c20d757d45c2e5  eudev-3.2.1.tar.gz
+md5 41e19b70462692fefd072a3f38818b6e  eudev-3.2.2.tar.gz
 # Locally calculated
-sha256 57e3d9e51cfefbdad431848ea0ad8ae1cde04928da42474f44bd200b12f5fe19  eudev-3.2.1.tar.gz
+sha256 3e4c56ec2fc1854afd0a31f3affa48f922c62d40ee12a0c1a4b4f152ef5b0f63  eudev-3.2.2.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 6a77881..fdb4432 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.1
+EUDEV_VERSION = 3.2.2
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
