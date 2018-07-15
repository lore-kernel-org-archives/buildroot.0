From: Christian Stewart <christian@paral.in>
Date: Sat, 14 Jul 2018 18:07:24 -0700
Subject: [Buildroot] [PATCH 4/6] runc: bump to 69663f0b
In-Reply-To: <20180715010732.21765-1-christian@paral.in>
References: <20180715010732.21765-1-christian@paral.in>
Message-ID: <20180715010732.21765-4-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps runc to the requisite version for Docker 2018.06.

Added note about where runc version dependency is declared:

RUNC_VERSION = 69663f0bd4b60df09991c08812a60108003fa340

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 3e188c5c79..d6bdfe24c7 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b5c50d7d9a5f610d5424f96196efa306ec708fd9299302dd919545099c16b7c1	runc-9c2d8d184e5da67c95d601382adf14862e4f2228.tar.gz
+sha256	994a3a0447fcbf7e37614b02aa5604d2d6b9fdb41e6870d8d3ff1138ed6e61ef  runc-69663f0bd4b60df09991c08812a60108003fa340.tar.gz
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
-- 
2.16.1
