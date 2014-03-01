From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 17:14:37 +0100
Subject: [Buildroot] [git commit] package/linux-headers: remove 2.6 snapshot
Message-ID: <20140301193723.171DE9936B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=971e331c54e08e82b4ed28a4eca8305933fa1cb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Thomas states:
    It is completely weird to ask the tarball to be named exactly
    linux-2.6.tar.bz2. IMO, we should simply get rid of this feature.

Make it so! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                     |    7 +++++++
 package/linux-headers/Config.in.host |    4 ----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 09c3a2b..cfcf5a3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
+config BR2_KERNEL_HEADERS_SNAP
+	bool "Local Linux snapshot support removed"
+	select BR2_LEGACY
+	help
+	  Support for using a custom snapshot to install the Linux
+	  kernel headers has been removed.
+
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	bool "/dev management by udev removed"
 	select BR2_LEGACY
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 134e338..fcecd62 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -56,9 +56,6 @@ choice
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
-
-	config BR2_KERNEL_HEADERS_SNAP
-		bool "Local Linux snapshot (linux-2.6.tar.bz2)"
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
@@ -81,5 +78,4 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.13"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.5"	if BR2_KERNEL_HEADERS_3_13
-	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
