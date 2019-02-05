From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 17:00:34 +0100
Subject: [Buildroot] [PATCH v2 08/10] package/mender: using
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
In-Reply-To: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
References: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549382436-15177-9-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the package to use the newly added
BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS in order to state clearly that
this package depends on the go compiler for target.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index aeb0b26..2f038eb 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_MENDER
 	bool "mender"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UBOOT_TOOLS # runtime
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
@@ -14,6 +13,5 @@ config BR2_PACKAGE_MENDER
 	  https://github.com/mendersoftware/mender
 
 comment "mender needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
