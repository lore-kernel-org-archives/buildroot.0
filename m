From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Feb 2014 10:02:55 +0100
Subject: [Buildroot] [PATCH] rpcbind: uses fork(), needs MMU
Message-ID: <1392109375-19568-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/d7c/d7c788749b54275154cc3934a7a32385cd72be61/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpcbind/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 578c6d6..e02fb95 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_RPCBIND
 	# support, needed for libtirpc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
@@ -16,3 +18,4 @@ comment "rpcbind needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
-- 
1.8.3.2
