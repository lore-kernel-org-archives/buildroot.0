From: Christian Stewart <christian@paral.in>
Date: Sat,  7 Dec 2019 11:57:07 -0800
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-golang: enable trimpath
 option for reproducible builds
Message-ID: <20191207195707.3798442-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -trimpath option removes absolute build paths from the target binary. This
results in more consistent / reproducible builds across different systems with
varying paths to Buildroot.

Signed-off-by: Christian Stewart <christian@paral.in>
---

v1 -> v2:

 - Fixed indentation on trimpath

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
-- 
2.24.0
