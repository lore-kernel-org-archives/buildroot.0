From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 20:07:32 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/docker-containerd: security bump to 1.4.4
Message-ID: <20210320185727.EF2FB81452@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4adf54868f754550164839e8051eff30b9ac29f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Security fix for CVE-2021-21334:

https://github.com/containerd/containerd/security/advisories/GHSA-6g2q-w5j3-fwh4

Other changes:

 - Fix container create in CRI to prevent possible environment variable leak between containers
 - Update shim server to return grpc NotFound error
 - Add bounds on max oom_score_adj value for shim's AdjustOOMScore
 - Update task manager to use fresh context when calling shim shutdown
 - Update Docker resolver to avoid possible concurrent map access panic
 - Update shim's log file open flags to avoid containerd hang on syscall open
 - Fix incorrect usage calculation

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 43a766e92d3b147c2118b9eb1ae008026d94f995)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index c5cfc137b8..bb544e8d60 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	bc6d9452c700af0ebc09c0da8ddba55be4c03ac8928e72ca92d98905800c8018  docker-containerd-1.4.3.tar.gz
+sha256  ac62c64664bf62fd44df0891c896eecdb6d93def3438271d7892dca75bc069d1  docker-containerd-1.4.4.tar.gz
 sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 6b79bd14ae..04114a7553 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.4.3
+DOCKER_CONTAINERD_VERSION = 1.4.4
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
