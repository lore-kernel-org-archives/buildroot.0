From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 18:58:29 +0200
Subject: [Buildroot] [git commit] package/uhd: USRP1 needs gcc >= 4.9
Message-ID: <20210522162959.0004F81385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0403dd7d76de21b220a00e1378a37d7a0b8d161f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c577eac16eaae515973faf3013da197516bfd391 forgot to add
dependencies of BR2_PACKAGE_UHD_USB to BR2_PACKAGE_UHD_USRP1

Fixes:
 - http://autobuild.buildroot.org/results/eaae6548fb536e2b0ea539c236cd7579e63fa21e

Note: threads dependency is already guaranteed as uhd itself depends on
NPTL already.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
