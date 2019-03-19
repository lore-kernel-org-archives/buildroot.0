From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Mar 2019 10:36:38 +1030
Subject: [Buildroot] [PATCH 3/3] linux: add support for Linux 5.0
In-Reply-To: <20190319000638.6259-1-joel@jms.id.au>
References: <20190319000638.6259-1-joel@jms.id.au>
Message-ID: <20190319000638.6259-4-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets 5.0 to be the default, moving from 4.19 which was used instead
of 4.20 for the LTS branch.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 linux/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 818b94e1c0df..7c647abf57fa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,10 +30,8 @@ config BR2_LINUX_NEEDS_MODULES
 choice
 	prompt "Kernel version"
 
-# We are intentionally staying at 4.19 for the next Buildroot LTS
-# release (2019.02)
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.19)"
+	bool "Latest version (5.0)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.171-cip30)"
@@ -123,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.25" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.20.1
