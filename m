From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:46 +0000
Subject: [Buildroot] [PATCH 3/9] package/go-bootstrap: Set CC to host CC
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <14cc3c8334b20ed8b9f5510556a4b83dc4f85e55.1463010771.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the host compiler when building host tools.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go-bootstrap/go-bootstrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index 1ced355..5dc839a 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -20,6 +20,7 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
 	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
+	CC=$(HOSTCC_NOCCACHE) \
 	CGO_ENABLED=0
 
 define HOST_GO_BOOTSTRAP_BUILD_CMDS
-- 
2.5.0
