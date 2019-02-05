From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 17:00:30 +0100
Subject: [Buildroot] [PATCH v2 04/10] package/docker-containerd: using
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
In-Reply-To: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
References: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549382436-15177-5-git-send-email-angelo@amarulasolutions.com>
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
 package/docker-containerd/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 851345f..ed799fa 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_DOCKER_CONTAINERD
 	bool "docker-containerd"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # util-linux
 	select BR2_PACKAGE_RUNC # runtime dependency
@@ -28,7 +27,6 @@ config BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
 endif
 
 comment "docker-containerd needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
