From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  6 May 2013 16:10:55 +0200
Subject: [Buildroot] [PATCH v4 3/5] linux: use
	BR2_LINUX_KERNEL_LATEST_VERSION as option name
In-Reply-To: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
References: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1367849457-31738-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a option name that doesn't change for every new 3.x version.
It's easier to maintain and consistent with barebox.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3ec687f..586db47 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -20,7 +20,7 @@ if BR2_LINUX_KERNEL
 choice
 	prompt "Kernel version"
 
-config BR2_LINUX_KERNEL_3_9
+config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "3.9"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.9" if BR2_LINUX_KERNEL_3_9
+	default "3.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.8.1.4
