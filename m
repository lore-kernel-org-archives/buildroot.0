From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 18:42:11 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-engine:
 needs more runtime dependencies
Message-ID: <20200813163705.D08EF856EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cb9d2ecabdf56d2a80610089f64e90e5edd58b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

fix error:
	failed to start daemon: Devices cgroup isn't mounted

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4f822965367cef8526ca0b3bac1ad090e5eeadb2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1fd229fcbb..4fe6956abd 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # docker-containerd -> runc
 	depends on BR2_USE_MMU # docker-containerd
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
