From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 21:38:51 +0200
Subject: [Buildroot] [git commit] runc: bump to 69663f0b
Message-ID: <20180916193908.67DB88841E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bcd3a28563abbc9c37136ca59c8426cb9c6060c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps runc to the requisite version for Docker 2018.06.

Added note about where runc version dependency is declared:

RUNC_VERSION = 69663f0bd4b60df09991c08812a60108003fa340

We take this opportunity to add the hash for the license file.

Signed-off-by: Christian Stewart <christian@paral.in>
[Thomas: add hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/runc/runc.hash | 3 ++-
 package/runc/runc.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 3e188c5c79..853cbb1465 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	b5c50d7d9a5f610d5424f96196efa306ec708fd9299302dd919545099c16b7c1	runc-9c2d8d184e5da67c95d601382adf14862e4f2228.tar.gz
+sha256	994a3a0447fcbf7e37614b02aa5604d2d6b9fdb41e6870d8d3ff1138ed6e61ef  runc-69663f0bd4b60df09991c08812a60108003fa340.tar.gz
+sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index f1586f32b2..7f42c962f3 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-RUNC_VERSION = 9c2d8d184e5da67c95d601382adf14862e4f2228
+# docker-engine/hack/dockerfile/install/runc.installer:4 RUNC_COMMIT=...
+RUNC_VERSION = 69663f0bd4b60df09991c08812a60108003fa340
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
