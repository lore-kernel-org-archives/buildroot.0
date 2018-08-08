From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  8 Aug 2018 10:45:59 +0200
Subject: [Buildroot] [PATCH 2/2] rust: bump version to 1.27.2
In-Reply-To: <20180808084559.3009-1-eric.le.bihan.dev@free.fr>
References: <20180808084559.3009-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180808084559.3009-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 1.27.2 and force use of "stable" channel when configuring.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust/rust.hash | 4 ++--
 package/rust/rust.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 6e6b0d9b6f..51b736be6d 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,5 +1,5 @@
-# From https://static.rust-lang.org/dist/rustc-1.27.1-src.tar.xz.sha256
-sha256 948e2645057960ee1c03d9f0e8f78133a5f73d9ca9a24bc56126e395a212d25c  rustc-1.27.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.27.2-src.tar.xz.sha256
+sha256 bf0228072ad60abd89dd81c8e25ae1e7b4b31e00e73612e7f4985e3144ad5bda  rustc-1.27.2-src.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 74df7d234a..541e49d43d 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.27.1
+RUST_VERSION = 1.27.2
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
@@ -61,6 +61,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'prefix = "$(HOST_DIR)"'; \
 		echo '[rust]'; \
 		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
+		echo 'channel = "stable"'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo $(HOST_RUST_JEMALLOC_CONF); \
-- 
2.14.4
