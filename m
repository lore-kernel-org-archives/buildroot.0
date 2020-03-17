From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2020 16:56:31 +0100
Subject: [Buildroot] [RFC PATCH 4/5] package/docker-engine: needs more
 runtime dependencies
In-Reply-To: <20200317155632.17649-1-francois.perrad@gadz.org>
References: <20200317155632.17649-1-francois.perrad@gadz.org>
Message-ID: <20200317155632.17649-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix error:
	failed to start daemon: Devices cgroup isn't mounted

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1fd229fcb..64afba30f 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
 	depends on BR2_USE_MMU # docker-containerd
+	select BR2_PACKAGE_CGROUPFS_MOUNT # runtime dependency
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
-- 
2.17.1
