From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 12 Apr 2013 08:55:05 +0100
Subject: [Buildroot] [PATCH] linux: fix 3.8.x stable version
Message-ID: <1365753305-5485-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Commit c461e64201598eae85ff32e130ed3f0ccd9fed78 bumped the linux 3.8.x
stable version from 3.8.5 to 3.8.6, but did so in only one of the two places
in which the version number is hard-coded in linux/Config.in

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 linux/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8208277..8d301a1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.8.5" if BR2_LINUX_KERNEL_3_8
+	default "3.8.6" if BR2_LINUX_KERNEL_3_8
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.10.4
