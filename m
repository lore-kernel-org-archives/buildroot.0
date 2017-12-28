From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 28 Dec 2017 16:51:41 +0100
Subject: [Buildroot] [PATCH v9 3/8] cargo-bin: new package
In-Reply-To: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171228155146.18193-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package fetches a binary version of Cargo, suitable to
bootstrap the host variants of the Rust compiler and Cargo, the package
manager.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                       |  1 +
 package/cargo-bin/cargo-bin.hash |  4 ++++
 package/cargo-bin/cargo-bin.mk   | 14 ++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cargo-bin/cargo-bin.hash
 create mode 100644 package/cargo-bin/cargo-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bf4766886d..0374e45eda 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -537,6 +537,7 @@ F:	package/xxhash/
 
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	package/adwaita-icon-theme/
+F:	package/cargo-bin/
 F:	package/darkhttpd/
 F:	package/eudev/
 F:	package/execline/
diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
new file mode 100644
index 0000000000..70fb101be7
--- /dev/null
+++ b/package/cargo-bin/cargo-bin.hash
@@ -0,0 +1,4 @@
+# From https://static.rust-lang.org/dist/cargo-0.23.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 7ebe231e5da2a06370f17050285ee694cf09ac2010d87dab334ae7eb7fb2d975  cargo-0.23.0-i686-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/cargo-0.23.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 4f33d9e511cfcbb370f470d3813e4877da10761d5f75460e538503fa07fa64f8  cargo-0.23.0-x86_64-unknown-linux-gnu.tar.xz
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
new file mode 100644
index 0000000000..e0f6381070
--- /dev/null
+++ b/package/cargo-bin/cargo-bin.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cargo-bin
+#
+################################################################################
+
+CARGO_BIN_VERSION = 0.23.0
+CARGO_BIN_SITE = https://static.rust-lang.org/dist
+CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+CARGO_BIN_LICENSE = Apache-2.0 or MIT
+CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+CARGO_BIN_STRIP_COMPONENTS = 1
+
+$(eval $(host-generic-package))
-- 
2.14.3
