From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:25:02 +0000
Subject: [Buildroot] [PATCH v2 3/6] package/flannel: Use HOST_GO_TARGET_ENV
In-Reply-To: <cover.1463696454.git.geoff@infradead.org>
References: <cover.1463696454.git.geoff@infradead.org>
Message-ID: <1f02b24129a57e1948108beeb38c6be80a2c587d.1463696454.git.geoff@infradead.org>
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
