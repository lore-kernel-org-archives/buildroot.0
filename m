From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed,  7 Aug 2019 13:42:41 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.4.1
Message-ID: <20190807114241.16456-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a bug-fix release addressing the following issues:

- fix GCC8 warnings when building python bindings
- fix a bug in gpioinfo where lines used by the kernel without any
  consumer string were reported as unused
- fix a bug in line::event_get_fd() in C++ bindings where the exception
  wouldn't be thrown in error cases due to a missing 'throw' keyword

It also fixed a couple problems with the test-suite but it doesn't
affect the buildroot package.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 2faa8bbbbb..f0009a7510 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 ebde83aaf14be3abd33e7a90faa487a2ee231e242897afe7fdefb765386b3c8b  libgpiod-1.4.tar.xz
+sha256 21ae8fd1f8dafc2eb2ba50e652390cf533d21351419a7426255895cb52e21b1c  libgpiod-1.4.1.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 07fa050007..2474ab90a2 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.4
+LIBGPIOD_VERSION = 1.4.1
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.21.0
