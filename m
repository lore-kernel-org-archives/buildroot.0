From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 12:16:36 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/docker-cli: bump
 version to 18.09.6
Message-ID: <20190510101149.327D88869A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80daab4f97763ac7fa7f5d57c863792fc934098f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
(cherry picked from commit c7e5f9cfc64862835e1d0764c6454abd3ee7311c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 987fbba3e9..e8af45ccea 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	dfed7e3b14643101e6d3746e722cbe8294dcf078c5405f3fb78bc38c7c17f0b1  docker-cli-v18.09.5.tar.gz
+sha256	02bcb73dde1c9542fa65c8b87078aaa1b01b0dbdd62346637bcf0999a2a0909f  docker-cli-v18.09.6.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 3ee9f5ca72..b71bd7097d 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = v18.09.5
+DOCKER_CLI_VERSION = v18.09.6
 DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
