From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 14:39:16 +0100
Subject: [Buildroot] [git commit] package/runc: bump to version 1.0.0-rc6
Message-ID: <20181230133551.0278083B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=247bb52b9c87bbf6535928fdba7df6efd8d165ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, a specific commit hash from the Docker runc.installer was
used to determine the required runc version for the Docker
Engine. This old commit hash used was a untagged pre-1.0.0 release of
runc, closer to an earlier release candidate.

The runc version used in the Debian distribution is not the pinned
version previously used by Buildroot. It is the latest release
candidate. The latest release candidate is known to be compatible with
the Docker Engine, and there is no justification for pinning to an
older RC anymore.

This commit bumps to the latest RC, 1.0.0-rc6. A v1.0.0 is expected
soon.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 853cbb1465..1636e5b8e9 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	994a3a0447fcbf7e37614b02aa5604d2d6b9fdb41e6870d8d3ff1138ed6e61ef  runc-69663f0bd4b60df09991c08812a60108003fa340.tar.gz
+sha256	a221f8380e7b5806031f54d423af6dde24c305dad49868056cf70e5f5f4ef771  runc-v1.0.0-rc6.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 7f42c962f3..0539661266 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# docker-engine/hack/dockerfile/install/runc.installer:4 RUNC_COMMIT=...
-RUNC_VERSION = 69663f0bd4b60df09991c08812a60108003fa340
+RUNC_VERSION = v1.0.0-rc6
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
