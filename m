From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:46 +0000
Subject: [Buildroot] [PATCH 2/9] package/go-bootstrap: Set CGO_ENABLED=0
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <2e8ab7d6d36bdc954535b9637f9ab8e131d64313.1463010771.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build erorros like these:

  cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go-bootstrap/go-bootstrap.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index bcf7c0b..1ced355 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -19,7 +19,8 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
 	GOOS=linux \
 	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
 	GOROOT="$(@D)" \
-	GOBIN="$(@D)/bin"
+	GOBIN="$(@D)/bin" \
+	CGO_ENABLED=0
 
 define HOST_GO_BOOTSTRAP_BUILD_CMDS
 	cd $(@D)/src && $(HOST_GO_BOOTSTRAP_MAKE_ENV) ./make.bash
-- 
2.5.0
