From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 09:15:37 +0100
Subject: [Buildroot] [git commit] package/libgpiod: bump version to v0.1.2
Message-ID: <20170204083947.199BE80DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=058b7f6a6529f188522bdde696cdc0f1b2dd0a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small bug-fix release:
  - include <poll.h> instead of <sys/poll.h> in gpioset
  - fix a formatting issue in gpioinfo for chips with >100 GPIO lines
  - fix a bug when requesting both-edges event notifications

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 7ba0531..9901be6 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 07f75ae1e0c086d28d77ef60d0566180698ce11c3271d89da444c0fc6c2f4580 libgpiod-v0.1.1.tar.gz
+sha256 c9a60e1073aacb25b4ad06d513f31416335b5a710f869cb7e838d2abb62e1e00 libgpiod-v0.1.2.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index e2e27f9..dbf9511 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = v0.1.1
+LIBGPIOD_VERSION = v0.1.2
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
 LIBGPIOD_LICENSE = GPLv3+
 LIBGPIOD_LICENSE_FILES = COPYING
