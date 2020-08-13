From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:32:19 -0700
Subject: [Buildroot] [PATCH v4 6/7] package/docker-proxy: fix go-module
 package identifier
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <20200813213220.260112-6-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-proxy/docker-proxy.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 8843266c30..41ae07da09 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -12,9 +12,7 @@ DOCKER_PROXY_LICENSE_FILES = LICENSE
 
 DOCKER_PROXY_DEPENDENCIES = host-pkgconf
 
-DOCKER_PROXY_WORKSPACE = gopath
-
-DOCKER_PROXY_BUILD_TARGETS = cmd/proxy
+DOCKER_PROXY_BUILD_TARGETS = github.com/docker/libnetwork/cmd/proxy
 
 define DOCKER_PROXY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/proxy $(TARGET_DIR)/usr/bin/docker-proxy
-- 
2.28.0
