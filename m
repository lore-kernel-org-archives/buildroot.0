From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 09:58:45 +0200
Subject: [Buildroot] [git commit master 1/1] linux/kernel-headers: bump
	2.6.32.x / 2.6.35.x stable versions
Message-ID: <20100927080007.A922E8B6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e7fce1b0295c86b5bcbae957db1efa08a386d8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add missing 2.6.35 patch.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in                                    |    6 +++---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |   15 +++++++--------
 4 files changed, 12 insertions(+), 13 deletions(-)
 copy toolchain/kernel-headers/{linux-2.6.32.22-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.23-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.32.22-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.35.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (87%)

diff --git a/linux/Config.in b/linux/Config.in
index 497a02e..a7109a5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_2_6_35
 
 config BR2_LINUX_KERNEL_2_6_35
-	bool "2.6.35.5"
+	bool "2.6.35.6"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -52,7 +52,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.35.5"
+	default "2.6.35.6"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.35.5" if BR2_LINUX_KERNEL_2_6_35
+	default "2.6.35.6" if BR2_LINUX_KERNEL_2_6_35
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 025e6a3..bfe6afb 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,9 +60,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.22"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.23"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
-	default "2.6.35.5"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.35.6"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.22-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.23-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
copy from toolchain/kernel-headers/linux-2.6.32.22-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
copy to toolchain/kernel-headers/linux-2.6.32.23-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.32.22-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 87%
rename from toolchain/kernel-headers/linux-2.6.32.22-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.35.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
index 2fc6176..1089c71 100644
--- a/toolchain/kernel-headers/linux-2.6.32.22-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
+++ b/toolchain/kernel-headers/linux-2.6.35.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
@@ -1,4 +1,4 @@
-From 5e0675efcec309617ba2d334c68ddb250ef942b2 Mon Sep 17 00:00:00 2001
+From 877aa0313e7d22b88d04ebef76392e1688fffff9 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <jacmet@sunsite.dk>
 Date: Fri, 27 Nov 2009 11:20:54 +0100
 Subject: [PATCH] scsi: use __uX types for headers exported to user space
@@ -17,14 +17,14 @@ before ???u8???
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 ---
  include/scsi/scsi.h         |    8 ++++----
- include/scsi/scsi_netlink.h |   20 ++++++++++----------
- 2 files changed, 14 insertions(+), 14 deletions(-)
+ include/scsi/scsi_netlink.h |    4 ++--
+ 2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/include/scsi/scsi.h b/include/scsi/scsi.h
-index 34c46ab..b3cffec 100644
+index 8b4deca..ec3053e 100644
 --- a/include/scsi/scsi.h
 +++ b/include/scsi/scsi.h
-@@ -145,10 +145,10 @@ struct scsi_cmnd;
+@@ -149,10 +149,10 @@ struct scsi_cmnd;
  
  /* defined in T10 SCSI Primary Commands-2 (SPC2) */
  struct scsi_varlen_cdb_hdr {
@@ -40,7 +40,7 @@ index 34c46ab..b3cffec 100644
  	/* service specific data follows */
  };
 diff --git a/include/scsi/scsi_netlink.h b/include/scsi/scsi_netlink.h
-index 536752c..7445c46 100644
+index 536752c..58ce8fe 100644
 --- a/include/scsi/scsi_netlink.h
 +++ b/include/scsi/scsi_netlink.h
 @@ -105,8 +105,8 @@ struct scsi_nl_host_vendor_msg {
@@ -54,7 +54,6 @@ index 536752c..7445c46 100644
  #define SCSI_NL_VID_ID_MASK		(~ SCSI_NL_VID_TYPE_MASK)
  
  
- 
 -- 
-1.6.5
+1.7.0
 
-- 
1.7.1
