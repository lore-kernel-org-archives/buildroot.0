From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:38:32 +0200
Subject: [Buildroot] [git commit branch/next] rust: bump version to 1.27.2
Message-ID: <20180809083239.70B1080E0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=831271b90101ae3961be9c547f15c245f7fd1a16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump version to 1.27.2 and force use of "stable" channel when configuring.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
