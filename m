From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Oct 2015 23:56:32 +0200
Subject: [Buildroot] [PATCH v2 1/2] libevdev: bump version to 1.4.4
Message-ID: <1444600593-27026-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]:

A couple of cleanups, one notable fix: we now transparently fix invalid
ABS_MT_TRACKING_ID ranges to something sensible.

The touchpad-edge-detector tool prints out suggested hwdb rules for
resolution overrides. And since the resolution is the main thing to fix on a
device, the libevdev-tweak-device now has a --resolution argument to quickly
set the resolution on the x/y axes.

[1] http://lists.freedesktop.org/archives/input-tools/2015-August/001210.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes
---
 package/libevdev/libevdev.hash | 4 ++--
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 1b7897d..1e44bf8 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-June/001171.html
-sha256 1c418b26fd78b0e9900872be2f77fb5311c877b34ec5c75efd1b670ed627969b libevdev-1.4.3.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-August/001210.html
+sha256 ed9979369b6a6e28f5897d099538549ecffb2b7c00c1b717eb77c31d85bc45a9 libevdev-1.4.4.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 082a7cc..d9a2be6 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4.3
+LIBEVDEV_VERSION = 1.4.4
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.1.4
