From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:04:43 +0200
Subject: [Buildroot] [git commit] package/flannel: Use HOST_GO_TARGET_ENV
Message-ID: <20160526191312.295297F93D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18ce12f0e1c54cc8d3b13063fbb0665c5554b474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the newly added HOST_GO_TARGET_ENV variable to pickup the
correct go environment for package builds.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
