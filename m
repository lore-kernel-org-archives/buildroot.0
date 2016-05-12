From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 00:08:46 +0000
Subject: [Buildroot] [PATCH 1/9] package/go-bootstrap: Add toolchain
	dependency
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <7254622f78c54dbcdbbca63e2fb68eed0e2355cf.1463010771.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build programs that need cgo support the toolchain needs to
be available.

Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/go-bootstrap/go-bootstrap.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index e404cb6..bcf7c0b 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -11,6 +11,8 @@ GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
 GO_BOOTSTRAP_LICENSE = BSD-3c
 GO_BOOTSTRAP_LICENSE_FILES = LICENSE
 
+HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain
+
 HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
 
 HOST_GO_BOOTSTRAP_MAKE_ENV = \
-- 
2.5.0
