From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 20:10:08 +0100
Subject: [Buildroot] [git commit] libgpiod: bump version to v0.3.2
Message-ID: <20171031190547.A08A07FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=078091b867ce552ce95c7c3a6027ac9fc6070924
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 28a0479..73150dc 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 6dfd6aeb544e8b7baf484a05c9ae0e67022c109362a41d87005393046b6beacf  libgpiod-0.3.1.tar.xz
+sha256 50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37  libgpiod-0.3.2.tar.xz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 7c2424b..bc2e51d 100644
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
