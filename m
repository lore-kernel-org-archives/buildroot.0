From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:54 +0100
Subject: [Buildroot] [PATCH 04/33] igh-ethercat: disable drivers build with
	kernel 3.6
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since hardware specific support is available for some given kernel
releases (mostly for kernel <=3.2), then disable them if kernel 3.6 is
enable. However, this still allows the generic driver build.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/igh-ethercat/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index 890bb12..4a0fd75 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -6,7 +6,12 @@ config BR2_PACKAGE_IGH_ETHERCAT
 
 	  http://www.etherlab.org/en/ethercat/index.php
 
-if BR2_PACKAGE_IGH_ETHERCAT
+if BR2_PACKAGE_IGH_ETHERCAT && !BR2_LINUX_KERNEL_3_6
+
+comment "The following drivers are only available for some"
+comment "releases of the kernel (mostly 2.6.x)."
+comment "Further details about the kernel/hardware support at:"
+comment "http://www.etherlab.org/en/ethercat/hardware.php"
 
 config BR2_PACKAGE_IGH_ETHERCAT_8139TOO
 	bool "8139too driver"
-- 
1.8.0
