From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:35:49 +0200
Subject: [Buildroot] [git commit branch/next] package/go: drop GO_TARGET_ENV
 / GO_HOST_ENV
Message-ID: <20200829124232.C3EE28152D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d26fb58b79c6412c49287923e562ea6c8d950e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that GO_TARGET_ENV and GO_HOST_ENV are just aliases to
HOST_GO_TARGET_ENV and HOST_GO_HOST_ENV, drop the former two, and use
the latter two directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 9904ddcc1a..7424c31924 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -23,12 +23,6 @@
 
 GO_BIN = $(HOST_DIR)/bin/go
 
-GO_TARGET_ENV = \
-	$(HOST_GO_TARGET_ENV)
-
-GO_HOST_ENV = \
-	$(HOST_GO_HOST_ENV)
-
 ################################################################################
 # inner-golang-package -- defines how the configuration, compilation and
 # installation of a Go package should be done, implements a few hooks to tune
@@ -102,7 +96,7 @@ endif
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
 		cd $$($(2)_SRC_PATH); \
-		$$(GO_TARGET_ENV) \
+		$$(HOST_GO_TARGET_ENV) \
 			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
@@ -115,7 +109,7 @@ else
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
 		cd $$($(2)_SRC_PATH); \
-		$$(GO_HOST_ENV) \
+		$$(HOST_GO_HOST_ENV) \
 			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
