From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:49 +0200
Subject: [Buildroot] [git commit] package/docker-cli: define <pkg>_GOMOD
 variable
Message-ID: <20200902161637.F11A685EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b80bcd7ffa5a815334ead9c99c6b938c4d6b5a7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the go.mod integration, define the DOCKER_CLI_GOMOD
variable.

We also use it as a handy shortcut when defining DOCKER_CLI_LDFLAGS.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-cli/docker-cli.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 1466b0afbd..9ef1270137 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -15,10 +15,11 @@ DOCKER_CLI_DEPENDENCIES = host-pkgconf
 
 DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
+DOCKER_CLI_GOMOD = github.com/docker/cli
 
 DOCKER_CLI_LDFLAGS = \
-	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_CLI_VERSION) \
-	-X github.com/docker/cli/cli.Version=$(DOCKER_CLI_VERSION)
+	-X $(DOCKER_CLI_GOMOD)/cli.GitCommit=$(DOCKER_CLI_VERSION) \
+	-X $(DOCKER_CLI_GOMOD)/cli.Version=$(DOCKER_CLI_VERSION)
 
 ifeq ($(BR2_PACKAGE_DOCKER_CLI_STATIC),y)
 DOCKER_CLI_LDFLAGS += -extldflags '-static'
