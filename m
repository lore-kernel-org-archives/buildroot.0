From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Jul 2014 10:42:59 -0300
Subject: [Buildroot] [PATCH] busybox: enable fdisk in default config
Message-ID: <1406295779-2323-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted by mnemoc on IRC the default busybox config doesn't enable
fdisk and util-linux is hidden by !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.
On modern systems fdisk usage is becoming more common so enable it, it
just adds up ~25 KiB to total binary size.
People who are on the edge for space savings will normally customize
their busybox config.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/busybox.config | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 544b82f..7b6d9b7 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -549,15 +549,15 @@ CONFIG_FEATURE_FBSET_FANCY=y
 CONFIG_FEATURE_FBSET_READMODE=y
 CONFIG_FDFLUSH=y
 CONFIG_FDFORMAT=y
-# CONFIG_FDISK is not set
-# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
-# CONFIG_FEATURE_FDISK_WRITABLE is not set
+CONFIG_FDISK=y
+CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_AIX_LABEL is not set
 # CONFIG_FEATURE_SGI_LABEL is not set
 # CONFIG_FEATURE_SUN_LABEL is not set
 # CONFIG_FEATURE_OSF_LABEL is not set
-# CONFIG_FEATURE_GPT_LABEL is not set
-# CONFIG_FEATURE_FDISK_ADVANCED is not set
+CONFIG_FEATURE_GPT_LABEL=y
+CONFIG_FEATURE_FDISK_ADVANCED=y
 # CONFIG_FINDFS is not set
 # CONFIG_FLOCK is not set
 CONFIG_FREERAMDISK=y
-- 
1.8.5.5
