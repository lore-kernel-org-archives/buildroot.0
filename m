From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 22:49:44 +0100
Subject: [Buildroot] [git commit] busybox: enable CONFIG_FEATURE_MDEV_RENAME
Message-ID: <20120102221533.3E98E8FF7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b12dfaf15cd9c1df55eed225754389303f76b013
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our default mdev.conf file in package/busybox has lines like:

  pcm.*           root:audio 660 =snd/
  event[0-9]+     root:root 640 =input/

that are used to create the device is the appropriate /dev
subdirectory. However, this feature requires
CONFIG_FEATURE_MDEV_RENAME to be enabled, otherwise mdev complains
with:

  mdev: bad line 25

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.x.config |    2 +-
 package/busybox/busybox-1.17.x.config |    2 +-
 package/busybox/busybox-1.18.x.config |    2 +-
 package/busybox/busybox-1.19.x.config |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox-1.16.x.config b/package/busybox/busybox-1.16.x.config
index e5f5102..24a27bf 100644
--- a/package/busybox/busybox-1.16.x.config
+++ b/package/busybox/busybox-1.16.x.config
@@ -516,7 +516,7 @@ CONFIG_LSPCI=y
 CONFIG_LSUSB=y
 CONFIG_MDEV=y
 CONFIG_FEATURE_MDEV_CONF=y
-# CONFIG_FEATURE_MDEV_RENAME is not set
+CONFIG_FEATURE_MDEV_RENAME=y
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 CONFIG_FEATURE_MDEV_EXEC=y
 # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
diff --git a/package/busybox/busybox-1.17.x.config b/package/busybox/busybox-1.17.x.config
index d131dd6..edf9c6d 100644
--- a/package/busybox/busybox-1.17.x.config
+++ b/package/busybox/busybox-1.17.x.config
@@ -547,7 +547,7 @@ CONFIG_LSPCI=y
 CONFIG_LSUSB=y
 CONFIG_MDEV=y
 CONFIG_FEATURE_MDEV_CONF=y
-# CONFIG_FEATURE_MDEV_RENAME is not set
+CONFIG_FEATURE_MDEV_RENAME=y
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 CONFIG_FEATURE_MDEV_EXEC=y
 # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
diff --git a/package/busybox/busybox-1.18.x.config b/package/busybox/busybox-1.18.x.config
index 502048d..9e41550 100644
--- a/package/busybox/busybox-1.18.x.config
+++ b/package/busybox/busybox-1.18.x.config
@@ -555,7 +555,7 @@ CONFIG_LSPCI=y
 CONFIG_LSUSB=y
 CONFIG_MDEV=y
 CONFIG_FEATURE_MDEV_CONF=y
-# CONFIG_FEATURE_MDEV_RENAME is not set
+CONFIG_FEATURE_MDEV_RENAME=y
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 CONFIG_FEATURE_MDEV_EXEC=y
 # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
diff --git a/package/busybox/busybox-1.19.x.config b/package/busybox/busybox-1.19.x.config
index 9f4603d..bf5e8df 100644
--- a/package/busybox/busybox-1.19.x.config
+++ b/package/busybox/busybox-1.19.x.config
@@ -563,7 +563,7 @@ CONFIG_LSPCI=y
 CONFIG_LSUSB=y
 CONFIG_MDEV=y
 CONFIG_FEATURE_MDEV_CONF=y
-# CONFIG_FEATURE_MDEV_RENAME is not set
+CONFIG_FEATURE_MDEV_RENAME=y
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 CONFIG_FEATURE_MDEV_EXEC=y
 # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
