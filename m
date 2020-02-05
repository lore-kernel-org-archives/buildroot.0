From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2020 13:50:54 +0100
Subject: [Buildroot] [git commit] package/docker-containerd: security bump
 to 1.2.12
Message-ID: <20200205124027.F39DB8C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ebb77ac1dd8dec2964ca7377be39ad082adb803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2019-19921: runc volume mount race condition with shared mounts

- CVE-2019-16884: runc through 1.0.0-rc8, as used in Docker through
  19.03.2-ce and other products, allows AppArmor restriction bypass because
  libcontainer/rootfs_linux.go incorrectly checks mount targets, and thus a
  malicious Docker image can mount over a /proc directory.

For details, see the announcement:
https://github.com/containerd/containerd/releases/tag/v1.2.12

containerd is now a separate CNCF sponsored project, and is no longer
explicitly associated with docker/moby.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 4 ++--
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index aad74089e9..a4acc17710 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	6a4192fced10c390373adfa9fa9a4f12fe9f38bde580d90468a79ed6c8af75ee  docker-containerd-1.2.11.tar.gz
-sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256 318886ea1efdec36f088fd6a0a0fe2b2f0ebdfd0066bdb4bd284bad12abc0a41  docker-containerd-1.2.12.tar.gz
+sha256 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 69068e44f8..67de8d7468 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.2.11
+DOCKER_CONTAINERD_VERSION = 1.2.12
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
