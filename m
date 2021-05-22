From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 18:29:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/uhd: USRP1 needs gcc >= 4.9
Message-ID: <20210522162924.16002-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit c577eac16eaae515973faf3013da197516bfd391 forgot to add
dependencies of BR2_PACKAGE_UHD_USB to BR2_PACKAGE_UHD_USRP1

Fixes:
 - http://autobuild.buildroot.org/results/eaae6548fb536e2b0ea539c236cd7579e63fa21e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uhd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index fae0887509..f61bbf0e8f 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -129,10 +129,14 @@ comment "USB support needs a toolchain w/ gcc >= 4.9"
 
 config BR2_PACKAGE_UHD_USRP1
 	bool "USRP1 support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_UHD_USB
 	help
 	  enable USRP1 support
 
+comment "USRP1 support needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_UHD_USRP2
 	bool "USRP2 support"
 	help
-- 
2.30.2
