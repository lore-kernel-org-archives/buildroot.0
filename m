From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 17:00:35 +0100
Subject: [Buildroot] [PATCH v2 09/10] package/runc: using
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
In-Reply-To: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
References: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549382436-15177-10-git-send-email-angelo@amarulasolutions.com>
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
 package/runc/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index fd5dee7..01ae5ad 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RUNC
 	bool "runc"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -10,6 +9,5 @@ config BR2_PACKAGE_RUNC
 	  https://github.com/opencontainers/runc
 
 comment "runc needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
-		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
