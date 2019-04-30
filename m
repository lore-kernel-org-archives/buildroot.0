From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 13:17:50 +0200
Subject: [Buildroot] [git commit] linux: bump Linux CIP to version
 v4.19.13-cip1
Message-ID: <20190430111513.A92CF83D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=669497c5e20aebd45071fd0f5424a4413ab7e411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps CIP to the latest SLTS version v4.19.13-cip1.
Kernel based on 4.4 is not deprecated, it will continue to be supported
as planned by the CIP foundation.
If the 4.4 version is needed, it should be selected manually.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c6f80e993a..a800a40af7 100644
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
