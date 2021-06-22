From: Christian Stewart <christian@paral.in>
Date: Mon, 21 Jun 2021 18:41:17 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/go-bootstrap: bump to version
 1.4-bootstrap-20171003
Message-ID: <20210622014117.2378875-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://golang.org/doc/install/source#bootstrapFromSource

All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
compiled Go version to use to build from source. Buildroot uses a 1.4.x version
in the "go-bootstrap" package to build a C-based Go compiler, and then uses that
compiler to build the main "host-go" compiler.

This commit updates to the latest 1.4.x go-bootstrap branch version recommended
in the documentation, which includes more compatibility fixes.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go-bootstrap/go-bootstrap.hash | 2 +-
 package/go-bootstrap/go-bootstrap.mk   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/go-bootstrap/go-bootstrap.hash b/package/go-bootstrap/go-bootstrap.hash
index 03fd7d571f..0f186a5d55 100644
--- a/package/go-bootstrap/go-bootstrap.hash
+++ b/package/go-bootstrap/go-bootstrap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959  go1.4.3.src.tar.gz
+sha256  f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52  go1.4-bootstrap-20171003.tar.gz
 sha256  dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  LICENSE
diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index 6710e31561..71696a1540 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-GO_BOOTSTRAP_VERSION = 1.4.3
-GO_BOOTSTRAP_SITE = https://storage.googleapis.com/golang
-GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
+# Use last C-based Go compiler: v1.4.x
+# See https://golang.org/doc/install/source#bootstrapFromSource
+GO_BOOTSTRAP_VERSION = 1.4-bootstrap-20171003
+GO_BOOTSTRAP_SITE = https://dl.google.com/go
+GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).tar.gz
 
 GO_BOOTSTRAP_LICENSE = BSD-3-Clause
 GO_BOOTSTRAP_LICENSE_FILES = LICENSE
-- 
2.32.0
