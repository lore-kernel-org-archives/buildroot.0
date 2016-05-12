From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:09:43 +0200
Subject: [Buildroot] [git commit] package/go-bootstrap: Set CGO_ENABLED=0
Message-ID: <20160512141034.BE43F81F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dfe8c19e91385469e279fd2ef1cb2dfd45c8968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build erorros like these:

  cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go-bootstrap/go-bootstrap.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index fd23628..47f5013 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -23,7 +23,8 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
 	GOOS=linux \
 	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
 	GOROOT="$(@D)" \
-	GOBIN="$(@D)/bin"
+	GOBIN="$(@D)/bin" \
+	CGO_ENABLED=0
 
 define HOST_GO_BOOTSTRAP_BUILD_CMDS
 	cd $(@D)/src && $(HOST_GO_BOOTSTRAP_MAKE_ENV) ./make.bash
