From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 16:51:14 +0100
Subject: [Buildroot] [PATCH 05/10] package/docker-engine: using
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
In-Reply-To: <1549381879-2207-1-git-send-email-angelo@amarulasolutions.com>
References: <1549381879-2207-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549381879-2207-6-git-send-email-angelo@amarulasolutions.com>
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
 package/docker-engine/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 2a0c130..0366e9d 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_DOCKER_ENGINE
 	bool "docker-engine"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
@@ -50,7 +49,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 endif
 
 comment "docker-engine needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
-- 
2.7.4
