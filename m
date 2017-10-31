From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 31 Oct 2017 11:02:06 +0100
Subject: [Buildroot] [PATCH] libgpiod: bump version to v0.3.2
Message-ID: <20171031100206.1785-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug fix release:
- correctly handle signal interrupts when polling in gpiod_simple_event_loop()
- fix the linking order when building with static libraries
- pass the correct consumer string to gpiod_simple_get_value_multiple() in
  gpioget
- fix a line test case: don't use open-drain or open-source flags for input
  mode
- fix the flags passed to ar in order to supress a build warning
- set the last error code in gpiod_chip_open_by_label() to ENOENT if a chip
  can't be found

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 28a0479bd7..73150dc9b9 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 6dfd6aeb544e8b7baf484a05c9ae0e67022c109362a41d87005393046b6beacf  libgpiod-0.3.1.tar.xz
+sha256 50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37  libgpiod-0.3.2.tar.xz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 7c2424bd65..bc2e51d280 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 0.3.1
+LIBGPIOD_VERSION = 0.3.2
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.13.2
