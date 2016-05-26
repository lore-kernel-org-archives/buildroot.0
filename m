From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 May 2016 18:21:32 +0000
Subject: [Buildroot] [PATCH v3 2/6] package/go: Add HOST_GO_TARGET_ENV
In-Reply-To: <cover.1464286518.git.geoff@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
Message-ID: <5251fd64eb4f2b365fd5e30abb0dc30439fd5201.1464286518.git.geoff@infradead.org>
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
index 7ac2540..090c5e4 100644
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
