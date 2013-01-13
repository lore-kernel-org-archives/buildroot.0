From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 19:39:59 +0100
Subject: [Buildroot] [PATCH 1/1 v2] Hide issue and hostname menu when using
	a custom skeleton.
Message-ID: <1358102400-9628-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Only show hostname and issue options when the default skeleton is selected.
Moved the menu sections so that when a custom skeleton is selected the 
issue and hostname options are hidden.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 v2 : Only hide issue and hostname menu when a custom skeleton is selected.

 system/Config.in | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 69863c4..5b38cae 100644
--- a/system/Config.in
+++ b/system/Config.in
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
 	bool "Passwords encoding"
 	default BR2_TARGET_GENERIC_PASSWD_MD5
@@ -173,6 +161,18 @@ endif
 
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
 config BR2_TARGET_GENERIC_ROOT_PASSWD
 	string "Root password"
 	default ""
-- 
1.8.0.1
