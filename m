From: Christian Stewart <christian@paral.in>
Date: Wed, 18 Oct 2017 20:22:53 -0400
Subject: [Buildroot] [PATCH 08/12] runc: bump to v1.0.0-rc4
In-Reply-To: <20171019002257.27646-1-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
Message-ID: <20171019002257.27646-8-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a dependency of docker-engine v2017.07.0-ce.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 3e188c5c79..08e306d0dc 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b5c50d7d9a5f610d5424f96196efa306ec708fd9299302dd919545099c16b7c1	runc-9c2d8d184e5da67c95d601382adf14862e4f2228.tar.gz
+sha256	3ffefd293932d2ad509701878dd7dd6ef498c3667198a33e8e5d5a3cbce0eeaa	runc-v1.0.0-rc4.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index fb3fec20f5..0b51e11896 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 9c2d8d184e5da67c95d601382adf14862e4f2228
+RUNC_VERSION = v1.0.0-rc4
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
@@ -38,7 +38,8 @@ define RUNC_CONFIGURE_CMDS
 endef
 
 define RUNC_BUILD_CMDS
-	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
+	cd $(RUNC_GOPATH)/src/github.com/opencontainers/runc && \
+		$(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
 		build -v -o $(@D)/bin/runc \
 		-tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
 endef
-- 
2.13.6
