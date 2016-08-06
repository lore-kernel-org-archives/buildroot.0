From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Aug 2016 00:04:35 +0200
Subject: [Buildroot] [PATCH] am33x-cm3: available only for ELF builds
Message-ID: <1470521075-16262-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The am33x-cm3 build system does some objcopy based binary file
manipulation that assumes the compiler for the platform generates ELF
file. While it's true for most ARM platforms, and especially the AM335x
based ones, it is no longer always true since we added support for
Cortex-M. Therefore, this package needs to depend on BR2_BINFMT_ELF.

Fixes:

  http://autobuild.buildroot.net/results/05f46ab28cbfc587e2e031bf38fb975447f8bab6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/am33x-cm3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/am33x-cm3/Config.in b/package/am33x-cm3/Config.in
index 060d0ef..d33dfaa 100644
--- a/package/am33x-cm3/Config.in
+++ b/package/am33x-cm3/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AM33X_CM3
 	bool "am33x-cm3"
 	depends on BR2_arm # only relevant for TI am335x
+	depends on BR2_BINFMT_ELF # assumes the compiler builds ELF file
 	help
 	  Cortex-M3 binary blob for suspend-resume on am335x
 
-- 
2.7.4
