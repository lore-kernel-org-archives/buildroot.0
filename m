From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:25:02 +0000
Subject: [Buildroot] [PATCH v2 2/6] package/go: Add HOST_GO_TARGET_ENV
In-Reply-To: <cover.1463696454.git.geoff@infradead.org>
References: <cover.1463696454.git.geoff@infradead.org>
Message-ID: <81f0d1d22fd706218b4daa92b4c7f82507c1e1ed.1463696454.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the convenience of package makefiles define the new
make variables HOST_GO_TOOLDIR and HOST_GO_TARGET_ENV.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/go.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 5acd75f..5e4ee09 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -35,6 +35,15 @@ endif
 HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_ROOT = $(HOST_DIR)/usr/lib/go
 
+# For the convienience of target packages.
+HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
+HOST_GO_TARGET_ENV = \
+	GOARCH=$(GO_GOARCH) \
+	GOROOT="$(HOST_GO_ROOT)" \
+	CC=$(TARGET_CC) \
+	CXX=$(TARGET_CXX) \
+	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
+
 # The go build system doesn't have the notion of cross compiling, but just the
 # notion of architecture.  When the host and target architectures are different
 # it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
-- 
2.5.0
