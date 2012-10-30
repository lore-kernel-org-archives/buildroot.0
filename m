From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 30 Oct 2012 21:45:19 +0100
Subject: [Buildroot] [PATCH 1/1] Do not ask for hostname and system banner
	when selecting a custom skeleton.
Message-ID: <1351629919-11452-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hostname and system banner should not be overwritten when a custom skeleton is selected.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 target/generic/Config.in | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index b8472f4..6490b0d 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -1,17 +1,5 @@
 menu "System configuration"
 
-config BR2_TARGET_GENERIC_HOSTNAME
-       string "System hostname"
-       default "buildroot"
-       help
-         Select system hostname to be stored in /etc/hostname.
-
-config BR2_TARGET_GENERIC_ISSUE
-       string "System banner"
-       default "Welcome to Buildroot"
-       help
-         Select system banner (/etc/issue) to be displayed at login.
-
 choice
 	prompt "/dev management"
 	default BR2_ROOTFS_DEVICE_CREATION_STATIC
@@ -118,6 +106,18 @@ endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_TARGET_GENERIC_HOSTNAME
+       string "System hostname"
+       default "buildroot"
+       help
+         Select system hostname to be stored in /etc/hostname.
+
+config BR2_TARGET_GENERIC_ISSUE
+       string "System banner"
+       default "Welcome to Buildroot"
+       help
+         Select system banner (/etc/issue) to be displayed at login.
+
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string "Port to run a getty (login prompt) on"
 	default "ttyS0"
-- 
1.8.0
