From: Christian Stewart <christian@paral.in>
Date: Sun,  2 May 2021 20:12:51 -0700
Subject: [Buildroot] [PATCH v1 2/2] package/docker-engine: docker-containerd
 was renamed to containerd
In-Reply-To: <20210503031251.200043-1-christian@paral.in>
References: <20210503031251.200043-1-christian@paral.in>
Message-ID: <20210503031251.200043-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 85a4bc6a0f..357101f280 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
-	depends on BR2_USE_MMU # docker-containerd
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
+	depends on BR2_USE_MMU # containerd
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
-	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
+	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
-- 
2.31.1
