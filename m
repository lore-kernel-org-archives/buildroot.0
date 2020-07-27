From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 10:13:44 +0200
Subject: [Buildroot] [git commit] package/docker-engine: needs more runtime
 dependencies
Message-ID: <20200727082207.7697488F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f822965367cef8526ca0b3bac1ad090e5eeadb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix error:
	failed to start daemon: Devices cgroup isn't mounted

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index fcbccbd5c0..85a4bc6a0f 100644
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
