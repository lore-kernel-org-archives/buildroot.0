From: Christian Stewart <christian@paral.in>
Date: Mon, 19 Oct 2020 02:08:25 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/docker-engine: bump to version
 19.03.13
In-Reply-To: <20201019090825.3677582-1-christian@paral.in>
References: <20201019090825.3677582-1-christian@paral.in>
Message-ID: <20201019090825.3677582-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Docker developers appear to no longer be tagging releases on the
docker/engine repository on GitHub, but are tagging releases on the main
moby/moby repository, which still is the true home of "dockerd."

This commit changes the upstream repo to moby/moby with no changes required.

Signed-off-by: Christian Stewart <christian@paral.in>

v1 -> v2:

 - updated hash
 - changed upstream to moby/moby

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 3283e4eb48..e7d5932687 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	858e4e74ee0097bcbdb71d737e268dfcfd1970efa4a1600354253b02fd403e39  docker-engine-19.03.12.tar.gz
+sha256	f43331fef1d24e31f43392fc1fed72b48fc17fd432d341d6eb1f68ca11383406  docker-engine-19.03.13.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2d92570b94..8cedf307ba 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.12
-DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = 19.03.13
+DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
-- 
2.28.0
