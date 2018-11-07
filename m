From: Christian Stewart <christian@paral.in>
Date: Wed,  7 Nov 2018 12:12:58 -0800
Subject: [Buildroot] [PATCH 1/2] go: specify GOARM when compiling target
 binaries
Message-ID: <20181107201259.28717-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, GOARM is not specified correctly when compiling target binaries. This
results in incompatibility / illegal instruction issues on some ARM devices.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index ec74ba397c..8423dc7eea 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -43,6 +43,7 @@ HOST_GO_ROOT = $(HOST_DIR)/lib/go
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
 	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOROOT="$(HOST_GO_ROOT)" \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
-- 
2.18.1
