From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:24:10 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/docker-engine:
 security bump to version 18.09.7
Message-ID: <20190707062928.1522E816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99616911e08484c813d6cc321d925faadc75e5c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes CVE-2018-15664: API endpoints behind the 'docker cp' command are
vulnerable to a symlink-exchange attack with Directory Traversal, giving
attackers arbitrary read-write access to the host filesystem with root
privileges, because daemon/archive.go does not do archive operations on a
frozen filesystem (or from within a chroot).

And includes additional post-18.09.6 fixes:

Builder
- Fixed a panic error when building dockerfiles that contain only comments.
  moby/moby#38487
- Added a workaround for GCR authentication issue. moby/moby#38246
- Builder-next: Fixed a bug in the GCR token cache implementation
  workaround.  moby/moby#39183

Runtime
- Added performance optimizations in aufs and layer store that helps in
  massively parallel container creation and removal.  moby/moby#39107,
  moby/moby#39135
- daemon: fixed a mirrors validation issue. moby/moby#38991
- Docker no longer supports sorting UID and GID ranges in ID maps.
  moby/moby#39288

Logging
- Added a fix that now allows large log lines for logger plugins.
  moby/moby#39038

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 13cf6f0c0bf0df313712aca8e4197ce96e29de89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 4e673f2856..4ef6905b5d 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	7cb45266fff79245c81ec86c455d4b0513ca5d4ec1b9be8c8330df30a9467481  docker-engine-v18.09.6.tar.gz
+sha256	b4f55831f5e7c5a92cd91f77aad1541ccd572eb18df2f44a01c372bceb3f9b6b  docker-engine-18.09.7.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 50d4129256..99e3088f65 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v18.09.6
-DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = 18.09.7
+DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
