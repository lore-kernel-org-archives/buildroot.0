From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:49 +0200
Subject: [Buildroot] [git commit branch/next] package/docker-engine: define
 <pkg>_GOMOD variable
Message-ID: <20200829124232.D895286CC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edb06ecf3b378f191d5ba36ba872d8a627b2eb53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the go.mod integration, define the
DOCKER_ENGINE_GOMOD variable.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/docker-engine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 6bb382f5a7..992a3448a0 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -12,6 +12,7 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
 DOCKER_ENGINE_SRC_SUBDIR = github.com/docker/docker
+DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
 DOCKER_ENGINE_LDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
