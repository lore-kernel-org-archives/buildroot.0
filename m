From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:47 +0000
Subject: [Buildroot] [PATCH 7/9] package/go: Add HOST_GO_TOOLDIR
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <ddb69607dbcc6bc85ea63a9b0f3541496de2b861.1463010771.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the convenience of package makefiles define the
new variable HOST_GO_TOOLDIR.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 00b1d21..4a99144 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -38,6 +38,7 @@ endif
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_ROOT = $(HOST_DIR)/usr/lib/go
+HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 
 HOST_GO_MAKE_ENV = \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
-- 
2.5.0
