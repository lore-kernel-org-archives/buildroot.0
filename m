From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:49:12 +0200
Subject: [Buildroot] [git commit branch/next] package/docker-proxy: drop
 <pkg>_WORKSPACE variable
Message-ID: <20200829124233.2721986CCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=913fac5bb1c9e38bd38637ea0271a1c513529a67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the go.mod integration, the <pkg>_WORKSPACE variable has become
useless, drop it.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-proxy/docker-proxy.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 8843266c30..6600b24ed9 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -12,8 +12,6 @@ DOCKER_PROXY_LICENSE_FILES = LICENSE
 
 DOCKER_PROXY_DEPENDENCIES = host-pkgconf
 
-DOCKER_PROXY_WORKSPACE = gopath
-
 DOCKER_PROXY_BUILD_TARGETS = cmd/proxy
 
 define DOCKER_PROXY_INSTALL_TARGET_CMDS
