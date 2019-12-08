From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2019 08:40:48 +0100
Subject: [Buildroot] [git commit] package/pkg-golang: enable trimpath option
 for reproducible builds
Message-ID: <20191208073535.0B7E388720@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=687230730dfb2bab9a54506867786c0bd1b985f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -trimpath option (introduced in go 1.13) removes absolute build paths
from the target binary.  This results in more consistent / reproducible
builds across different systems with varying paths to Buildroot.

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: mention that this is a go 1.13+ feature]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index e47de17aba..2494ce028c 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -61,6 +61,7 @@ $(2)_WORKSPACE ?= _gopath
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-tags "$$($(2)_TAGS)" \
+	-trimpath \
 	-p $(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host.
