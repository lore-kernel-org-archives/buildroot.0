From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 21 Mar 2017 18:02:37 +0200
Subject: [Buildroot] [PATCH v2] Revert "bluez5_utils: not available with
	uClibc"
In-Reply-To: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20170321160237.31058-3-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since uClibc supports wordexp functionality we may revert
the commit d7c54cb0c0cf.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/bluez5_utils/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index e99f0f69f..315747592 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -39,15 +39,10 @@ comment "OBEX support needs a toolchain w/ C++"
 
 config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	bool "build CLI client"
-	# wordexp support not in our uClibc configuration
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_READLINE
 	help
 	  Enable the Bluez 5.x command line client.
 
-comment "bluez5-utils client needs a glibc or musl toolchain"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
-
 config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
 	bool "build deprecated tools"
 	help
-- 
2.11.0
