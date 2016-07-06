From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 23:06:02 +0200
Subject: [Buildroot] [git commit] docker-containerd: needs CGO linking
Message-ID: <20160706210625.B2C81820EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d988ec6f56e6276a5f3f3e98b4dd17b5ac29d91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/09a23c8926ce32408fbbfa1fb5b3ed7c4f8733e3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-containerd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 85843b8..99af917 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOCKER_CONTAINERD
 	bool "docker-containerd"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_USE_WCHAR # util-linux
@@ -17,5 +18,6 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 
 comment "docker-containerd needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
