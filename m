From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:06:57 +0200
Subject: [Buildroot] [git commit] package/go-bootstrap: Add toolchain
	dependency
Message-ID: <20160512141034.5768581E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=def633c4c5b339d13ef221cfa5c202aaf9989f91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To build programs that need cgo support the toolchain needs to
be available.

Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Geoff Levand <geoff@infradead.org>
[Thomas: add comment in the code about the toolchain dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go-bootstrap/go-bootstrap.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index e404cb6..fd23628 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -11,6 +11,12 @@ GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
 GO_BOOTSTRAP_LICENSE = BSD-3c
 GO_BOOTSTRAP_LICENSE_FILES = LICENSE
 
+# To build programs that need cgo support the toolchain needs to be
+# available, so the toolchain is not needed to build host-go-bootstrap
+# itself, but needed by other packages that depend on
+# host-go-bootstrap.
+HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain
+
 HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
 
 HOST_GO_BOOTSTRAP_MAKE_ENV = \
