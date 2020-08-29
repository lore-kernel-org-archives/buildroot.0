From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 15:02:30 +0200
Subject: [Buildroot] [git commit] package/docker-cli: drop <pkg>_WORKSPACE
 variable
Message-ID: <20200902161638.478ED85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6354edea04f4e8621310b66c2c320db72af8cfd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the go.mod integration, the <pkg>_WORKSPACE variable is useless,
so drop it.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-cli/docker-cli.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 9ef1270137..fd96ff9f35 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -6,7 +6,6 @@
 
 DOCKER_CLI_VERSION = 19.03.11
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
-DOCKER_CLI_WORKSPACE = gopath
 
 DOCKER_CLI_LICENSE = Apache-2.0
 DOCKER_CLI_LICENSE_FILES = LICENSE
