From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 18:40:00 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-engine:
 bump to version 19.03.13
Message-ID: <20201029185152.6AE1B8653D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f70d050e0e04e42568173f8f04d4eab5a55197c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The Docker developers appear to no longer be tagging releases on the
docker/engine repository on GitHub, but are tagging releases on the main
moby/moby repository, which still is the true home of "dockerd."

This commit changes the upstream repo to moby/moby with no changes required.

Signed-off-by: Christian Stewart <christian@paral.in>

v1 -> v2:

 - updated hash
 - changed upstream to moby/moby

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5ebd4d9a61435e61561344ce5eca8d6960f2a8bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 61d0bed7fd..261deed505 100644
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
