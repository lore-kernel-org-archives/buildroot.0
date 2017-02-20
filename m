From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:02:52 +0100
Subject: [Buildroot] [git commit branch/next] linux: fix up bad merge
	conflict
Message-ID: <20170220210349.3AC2E82156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09c989420db1599c7650ae614c672ea5e699d641
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix commit 400eaa3452e9380ec77ac62266530055506ea6e7 ("linux: bump
default to version 4.10") in which a conflict was not correctly
resolved.

Reported-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7f18219..890b848 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -97,11 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-<<<<<<< a1e02440f3035cfbe5119c00457b3e1c2f7ac4d1
-	default "4.9.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-=======
 	default "4.10" if BR2_LINUX_KERNEL_LATEST_VERSION
->>>>>>> linux: bump default to version 4.10
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
