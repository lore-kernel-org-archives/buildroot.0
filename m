From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Apr 2018 17:25:40 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.0.1
Message-ID: <20180412152540.32447-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bugfix release. It contains the following changes since v1.0:

- include Doxyfile in the release tarball
- fix the implicit-fallthrough warnings
- make tests work together with gpio-mockup post v4.16 linux kernel
- use reference counting for line file descriptors to avoid calling
  close() on the same descriptors multiple times

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index b29e12ebd2..9ed4b59ab9 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 34c76b3730b9d4a1159bcb14000f78b1e890251b8a3823b794fa930654eabdd0  libgpiod-1.0.tar.xz
+sha256 972924195367f5fb045c023d65340c4b7dfc8764499516be446553865208dedc  libgpiod-1.0.1.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 598adcc599..7f8fa4b7dd 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.0
+LIBGPIOD_VERSION = 1.0.1
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.17.0
