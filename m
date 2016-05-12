From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:48 +0000
Subject: [Buildroot] [PATCH 9/9] package/flannel: Set go env variables
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <9caa1646d3da7936fb25fd4e4cd2dcd8b8387374.1463010772.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To get cross compile builds working correctly.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/flannel/flannel.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 876efe6..dd500bb 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -17,7 +17,11 @@ FLANNEL_MAKE_ENV = \
 	GOBIN="$(@D)/bin" \
 	GOPATH="$(@D)/gopath" \
 	GOARCH=$(GO_GOARCH) \
-	CGO_ENABLED=1
+	CGO_ENABLED=1 \
+	CC=$(TARGET_CC) \
+	CXX=$(TARGET_CXX) \
+	GOROOT="$(HOST_GO_ROOT)" \
+	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
 FLANNEL_GLDFLAGS = \
 	-X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION) \
-- 
2.5.0
