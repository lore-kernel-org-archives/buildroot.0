From: Christian Stewart <christian@paral.in>
Date: Wed, 10 Feb 2021 15:52:02 -0800
Subject: [Buildroot] [PATCH v1 2/3] package/docker-engine: security bump to
 version 20.10.3
In-Reply-To: <20210210235203.2819535-1-christian@paral.in>
References: <20210210235203.2819535-1-christian@paral.in>
Message-ID: <20210210235203.2819535-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security fixes:

 - CVE-2021-21285 Prevent an invalid image from crashing docker daemon
 - CVE-2021-21284 Lock down file permissions to prevent remapped root from accessing docker state
 - Ensure AppArmor and SELinux profiles are applied when building with BuildKit

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 2519ddaecd..69ebd113ea 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0fda46a82bf8f624eb349370358891d3bc65ef3e320675226f17dba8f62566d  docker-engine-20.10.1.tar.gz
+sha256  62bb03f197b8a064da568e62639f6834f91c8cfc9273126a978847becc214c31  docker-engine-20.10.3.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 058960119a..bbc97af8b5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.1
+DOCKER_ENGINE_VERSION = 20.10.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.30.0
