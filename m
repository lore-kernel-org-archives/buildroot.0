From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 17:23:36 +0200
Subject: [Buildroot] [git commit] package/pkg-golang: add PATH in
 GO_TARGET_ENV
Message-ID: <20180402152809.270E282568@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbe32d364a5ff44c6d0bb086626ceb8cd76dee18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some Go packages use pkg-config to detect native libraries, so we must
have $(BR_PATH) in the PATH so that our pkg-config in HOST_DIR gets
used.

Fixes:

  http://autobuild.buildroot.net/results/f85414244c25aba07a05109b5cd7658ae44a64ea/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index f23bda390d..bf178622b5 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -27,6 +27,7 @@ GO_BIN = $(HOST_DIR)/bin/go
 # cross-compiled binaries when GOBIN is set"
 GO_TARGET_ENV = \
 	$(HOST_GO_TARGET_ENV) \
+	PATH=$(BR_PATH) \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
 
