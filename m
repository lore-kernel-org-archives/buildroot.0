From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Dec 2020 08:16:00 +0100
Subject: [Buildroot] [git commit] package/docker-containerd: security bump
 to version 1.4.3
Message-ID: <20201202070158.541BE82A1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e1d1278c7112f44ce694958047ee512f20b4360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2020-15257: Access controls for the shim???s API socket verified that
  the connecting process had an effective UID of 0, but did not otherwise
  restrict access to the abstract Unix domain socket.  This would allow
  malicious containers running in the same network namespace as the shim,
  with an effective UID of 0 but otherwise reduced privileges, to cause new
  processes to be run with elevated privileges.

For more details, see the advisory:
https://github.com/containerd/containerd/security/advisories/GHSA-36xw-fx78-c5r4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 2ec3d042ba..c5cfc137b8 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	d410b8efc94e4124990f01de7107223971be8c9258fc651decf9e0ba648485b5  docker-containerd-1.4.1.tar.gz
+sha256	bc6d9452c700af0ebc09c0da8ddba55be4c03ac8928e72ca92d98905800c8018  docker-containerd-1.4.3.tar.gz
 sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 71f9b4c065..d9a0eb28a6 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.4.1
+DOCKER_CONTAINERD_VERSION = 1.4.3
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
