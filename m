From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Mar 2014 09:04:31 +0100
Subject: [Buildroot] [git commit] uboot: mark custom network settings as
	deprecated
Message-ID: <20140318080519.50A4F9C127@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a920fdd007b523c0000206bc5718a4c5c60a15be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the the mailing list.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in            |    4 ++++
 boot/uboot/Config.in |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index b904195..5823274 100644
--- a/Config.in
+++ b/Config.in
@@ -296,6 +296,10 @@ config BR2_DEPRECATED_SINCE_2014_02
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2014_05
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 035e550..90437b5 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -169,6 +169,7 @@ endif
 
 menuconfig BR2_TARGET_UBOOT_NETWORK
 	bool "Custom Network Settings"
+	depends on BR2_DEPRECATED_SINCE_2014_05
 	help
 	  Custom network settings for U-boot
 
