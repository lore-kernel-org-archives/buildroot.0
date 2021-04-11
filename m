From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 21:38:33 +0200
Subject: [Buildroot] [git commit] package/docker-engine: add CPE variables
Message-ID: <20210411191302.6C6A7803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b59ebb66f35ed79dcd07068dd5bd101c44ad6248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:docker:docker is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adocker%3Adocker

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index d3f4d81572..767818ebba 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -13,6 +13,9 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
+DOCKER_ENGINE_CPE_ID_VENDOR = docker
+DOCKER_ENGINE_CPE_ID_PRODUCT = docker
+
 DOCKER_ENGINE_LDFLAGS = \
 	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.BuildTime="" \
 	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.GitCommit="buildroot" \
