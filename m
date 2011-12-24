From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Dec 2011 11:17:51 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: enable CONFIG_FEATURE_MDEV_RENAME
In-Reply-To: <cover.1324721862.git.thomas.petazzoni@free-electrons.com>
References: <cover.1324721862.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fffe1c804316e582ce858ed3a3bb594559c34bab.1324721862.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our default mdev.conf file in package/busybox has lines like:

  pcm.*           root:audio 660 =snd/
  event[0-9]+     root:root 640 =input/

that are used to create the device is the appropriate /dev
subdirectory. However, this feature requires
CONFIG_FEATURE_MDEV_RENAME to be enabled, otherwise mdev complains
with:

  mdev: bad line 25

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
