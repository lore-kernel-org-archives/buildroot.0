From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 May 2016 18:21:33 +0000
Subject: [Buildroot] [PATCH v3 3/6] package/flannel: Use HOST_GO_TARGET_ENV
In-Reply-To: <cover.1464286518.git.geoff@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
Message-ID: <e11c125146bda639dbf31b256450f7ae61fd3678.1464286518.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the newly added HOST_GO_TARGET_ENV variable to pickup the
correct go environment for package builds.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/flannel/flannel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 876efe6..b5f61a0 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -14,9 +14,9 @@ FLANNEL_LICENSE_FILES = LICENSE
 FLANNEL_DEPENDENCIES = host-go
 
 FLANNEL_MAKE_ENV = \
+	$(HOST_GO_TARGET_ENV) \
 	GOBIN="$(@D)/bin" \
 	GOPATH="$(@D)/gopath" \
-	GOARCH=$(GO_GOARCH) \
 	CGO_ENABLED=1
 
 FLANNEL_GLDFLAGS = \
-- 
2.5.0
