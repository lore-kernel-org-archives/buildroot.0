From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 16:28:39 +0200
Subject: [Buildroot] [git commit] linux: use BR2_LINUX_KERNEL_LATEST_VERSION
	as option name
Message-ID: <20130506143834.3742E99C41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c719ded2b94e2d53988d592c9229ad3544e5168e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a option name that doesn't change for every new 3.x version.
It's easier to maintain and consistent with barebox.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
