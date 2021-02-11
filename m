From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 22:16:33 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-engine:
 security bump to version 19.03.15
Message-ID: <20210211214512.2BAE6815F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcdb238f60c87cdfa1cc224cc6dac2d8de774cce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- CVE-2021-21285 Prevent an invalid image from crashing docker daemon
  https://github.com/moby/moby/security/advisories/GHSA-6fj5-m822-rqx8

- CVE-2021-21284 Lock down file permissions to prevent remapped root from
  accessing docker state
  https://github.com/moby/moby/security/advisories/GHSA-7452-xqpj-6rpc

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index e7d5932687..a2e6d772ba 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f43331fef1d24e31f43392fc1fed72b48fc17fd432d341d6eb1f68ca11383406  docker-engine-19.03.13.tar.gz
+sha256	ef5cd0bdd3e06102dcdae72ffba7f89e663c680d9dc17b811f51aad8ff5b0405  docker-engine-19.03.15.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 261deed505..b7b9f5e538 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.13
+DOCKER_ENGINE_VERSION = 19.03.15
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
