From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 22:39:07 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-engine:
 security bump to version 19.03.11
Message-ID: <20200712203609.C0E4883ACB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7b06e5c91c228c76a3813bdbbc985bff0c0b57f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- CVE-2020-13401: Disable IPv6 Router Advertisements to prevent address
  spoofing
  An attacker in a container, with the CAP_NET_RAW capability, can craft
  IPv6 router advertisements, and consequently spoof external IPv6 hosts,
  obtain sensitive information, or cause a denial of service.

In addition, 19.03.9..11 fixes a number of issues. For details, see:

https://docs.docker.com/engine/release-notes/

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: mention security impact, extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b73b3835f4a287d20d3c83a5e4587f9c56df5393)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index c23eea90a8..99159f9376 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	13ec45ad45091111bd566aca9d81989b3f05e0625dab68d33c3ad81ff924172f  docker-engine-19.03.8.tar.gz
+sha256	5ff62d7b3638a275b2c459e53a4d1a7a8fb03dde8305defcd55e05e059e5618d  docker-engine-19.03.11.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 78f6c1261c..2f622014ba 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.8
+DOCKER_ENGINE_VERSION = 19.03.11
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
