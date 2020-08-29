From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:49 +0200
Subject: [Buildroot] [git commit branch/next] package/docker-containerd:
 define <pkg>_GOMOD variable
Message-ID: <20200829124232.CE03C81FCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01c5e0ed72007433160d858a8c06cc84eafc120c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the go.mod integration, define the
DOCKER_CONTAINERD_GOMOD variable.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 5a44489065..343d587907 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -10,6 +10,7 @@ DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 
 DOCKER_CONTAINERD_WORKSPACE = vendor
+DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
 
 DOCKER_CONTAINERD_LDFLAGS = \
 	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
