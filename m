From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Sun, 11 Mar 2018 15:00:39 -0700
Subject: [Buildroot] [PATCH 3/3] runc: bump to v1.0.0-rc5
In-Reply-To: <20180311220039.11021-1-charles.hardin@storagecraft.com>
References: <20180311220039.11021-1-charles.hardin@storagecraft.com>
Message-ID: <20180311220039.11021-3-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

This is a dependency of docker-engine v2017.12.1-ce.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 3e188c5c79..f403b6d9e2 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b5c50d7d9a5f610d5424f96196efa306ec708fd9299302dd919545099c16b7c1	runc-9c2d8d184e5da67c95d601382adf14862e4f2228.tar.gz
+sha256	770e180d1cca1f3c1a67512ebf9720caafe97af4fc2fe12fa43a3cf7bfa77522	runc-v1.0.0-rc5.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index fb3fec20f5..21271cd7a3 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 9c2d8d184e5da67c95d601382adf14862e4f2228
+RUNC_VERSION = v1.0.0-rc5
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
@@ -38,7 +38,8 @@ define RUNC_CONFIGURE_CMDS
 endef
 
 define RUNC_BUILD_CMDS
-	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
+	cd $(RUNC_GOPATH)/src/github.com/opencontainers/runc &&
+		$(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
 		build -v -o $(@D)/bin/runc \
 		-tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
 endef
-- 
2.14.3 (Apple Git-98)
