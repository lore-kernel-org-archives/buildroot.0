From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 30 Apr 2019 12:49:09 +0200
Subject: [Buildroot] [PATCH] linux: bump Linux CIP to version v4.19.13-cip1
Message-ID: <1556621349-18581-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps CIP to the latest SLTS version v4.19.13-cip1.
Kernel based on 4.4 is not deprecated, it will continue to be supported
as planned by the CIP foundation.
If the 4.4 version is needed, it should be selected manually.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c6f80e9..a800a40 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -34,7 +34,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.0)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.176-cip31)"
+	bool "Latest CIP SLTS version (v4.19.13-cip1)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -122,7 +122,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.0.10" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.4
