From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed,  7 Jan 2015 16:15:28 -0500
Subject: [Buildroot] [PATCH v3] linux: hide custom patches when using a
	local tree
Message-ID: <1420665328-2704-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using a custom local tree, we're using the OVERRIDE_SRCDIR
internally, which means we do not apply patches. Since this is the
expected behavior, make BR2_LINUX_KERNEL_PATCH and
BR2_LINUX_KERNEL_CUSTOM_LOCAL options exclusive.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/Config.in b/linux/Config.in
index bf30426..13ae1ac 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -119,6 +119,7 @@ config BR2_LINUX_KERNEL_VERSION
 
 config BR2_LINUX_KERNEL_PATCH
 	string "Custom kernel patches"
+	depends on !BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	help
 	  A space-separated list of patches to apply to the
 	  kernel. Each patch can be described as an URL, a local file
-- 
2.2.1
