From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:16:53 +0200
Subject: [Buildroot] [git commit] busybox: enable fdisk in default config
Message-ID: <20140726071718.F1FFB9D2FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d06256b6619c489ab4418bf2703298ca1d3f61e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noted by mnemoc on IRC the default busybox config doesn't enable
fdisk and util-linux is hidden by !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.
On modern systems fdisk usage is becoming more common so enable it, it
just adds up ~25 KiB to total binary size.
People who are on the edge for space savings will normally customize
their busybox config.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.config |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

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
