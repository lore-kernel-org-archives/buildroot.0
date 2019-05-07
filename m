From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 17:02:15 +0200
Subject: [Buildroot] [git commit] package/docker-engine: bump version to
 18.09.6
Message-ID: <20190507145846.236228830A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d692ecb05489ee783090ddd95ba47ee296a50bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Additional post-18.09.5 fixes:

Builder:
- Fixed COPY and ADD with multiple <src> to not invalidate cache if
  DOCKER_BUILDKIT=1.moby/moby#38964

Networking:
- Cleaned up the cluster provider when the agent is closed. docker/libnetwork#2354
- Windows: Now selects a random host port if the user does not specify a
  host port.  docker/libnetwork#2369
- --service-cluster-ip-range is now configurable for UCP install.
  docker/orca#10263

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 28f1d72136..4e673f2856 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f6c1f2cff88c1f143fe9c16ea6555eace68ef17a5b7803dc5d5fa0a1f45a3a97  docker-engine-v18.09.5.tar.gz
+sha256	7cb45266fff79245c81ec86c455d4b0513ca5d4ec1b9be8c8330df30a9467481  docker-engine-v18.09.6.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7b0f451ee9..50d4129256 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v18.09.5
+DOCKER_ENGINE_VERSION = v18.09.6
 DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
