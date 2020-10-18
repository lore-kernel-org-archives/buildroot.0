From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Oct 2020 21:28:18 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 package/docker-containerd: security bump to version 1.2.14
Message-ID: <20201018191645.6CB5B814ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38c34d5d866b45a732f9fb724c8570be0d3c0911
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes the following security issue:

- CVE-2020-15157: containerd v1.2.x can be coerced into leaking credentials
  during image pull

For details, see the advisory:
https://github.com/containerd/containerd/security/advisories/GHSA-742w-89gc-8m9c

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 4 ++--
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 95288be58b..6fbb228ed2 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	0811057ab67b78ce911416e793edaeb14b3f1e105d67b8e67b6302e0eab572e4  docker-containerd-1.2.13.tar.gz
-sha256 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256	80ea55655612d7d9f9e8e10df5993a3636b088390e1a372962687d70ef265d97  docker-containerd-1.2.14.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 5a44489065..64cb086fef 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.2.13
+DOCKER_CONTAINERD_VERSION = 1.2.14
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
