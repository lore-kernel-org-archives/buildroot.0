From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 19:23:47 +0200
Subject: [Buildroot] [git commit] rust: bump version to 1.29.2
Message-ID: <20181020172232.D1C1C86698@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fea80fc0a7347e82dd08e28445e48fef4f03764b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-warnings-in-library-from-error-chain.patch | 25 ----------------------
 ...mit-warnings-inside-error-chain-expansion.patch | 25 ----------------------
 package/rust/rust.hash                             |  4 ++--
 package/rust/rust.mk                               |  2 +-
 4 files changed, 3 insertions(+), 53 deletions(-)

diff --git a/package/rust/0001-Fix-warnings-in-library-from-error-chain.patch b/package/rust/0001-Fix-warnings-in-library-from-error-chain.patch
deleted file mode 100644
index be9d2a87c7..0000000000
--- a/package/rust/0001-Fix-warnings-in-library-from-error-chain.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From ac3ffd15e1cf16059b4ccd90b7c816b078a621a5 Mon Sep 17 00:00:00 2001
-From: Mark Simulacrum <mark.simulacrum@gmail.com>
-Date: Wed, 20 Jun 2018 19:47:00 -0600
-Subject: [PATCH] Fix warnings in library from error-chain
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/lib.rs | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git rust-1.27.1.orig/src/tools/rust-installer/src/lib.rs rust-1.27.1/src/tools/rust-installer/src/lib.rs
-index ff0495b..cc5e740 100644
---- rust-1.27.1.orig/src/tools/rust-installer/src/lib.rs
-+++ rust-1.27.1/src/tools/rust-installer/src/lib.rs
-@@ -22,6 +22,7 @@ extern crate winapi;
- #[macro_use]
- extern crate lazy_static;
- 
-+#[allow(warnings)]
- mod errors {
-     error_chain!{
-         foreign_links {
--- 
-2.11.0
-
diff --git a/package/rust/0001-Permit-warnings-inside-error-chain-expansion.patch b/package/rust/0001-Permit-warnings-inside-error-chain-expansion.patch
deleted file mode 100644
index 6c332bc0ba..0000000000
--- a/package/rust/0001-Permit-warnings-inside-error-chain-expansion.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d90cef58439bcd14426d64b16599e060cd6464f9 Mon Sep 17 00:00:00 2001
-From: Mark Simulacrum <mark.simulacrum@gmail.com>
-Date: Wed, 20 Jun 2018 16:54:40 -0600
-Subject: [PATCH] Permit warnings inside error-chain expansion
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/main.rs | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git rust-1.27.1.orig/src/tools/rust-installer/src/main.rs rust-1.27.1/src/tools/rust-installer/src/main.rs
-index cabffb8..007ed71 100644
---- rust-1.27.1.orig/src/tools/rust-installer/src/main.rs
-+++ rust-1.27.1/src/tools/rust-installer/src/main.rs
-@@ -7,6 +7,7 @@ extern crate installer;
- use errors::*;
- use clap::{App, ArgMatches};
- 
-+#[allow(warnings)]
- mod errors {
-     error_chain!{
-         links {
--- 
-2.11.0
-
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 51b736be6d..1caab5a4ca 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,5 +1,5 @@
-# From https://static.rust-lang.org/dist/rustc-1.27.2-src.tar.xz.sha256
-sha256 bf0228072ad60abd89dd81c8e25ae1e7b4b31e00e73612e7f4985e3144ad5bda  rustc-1.27.2-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.29.2-src.tar.xz.sha256
+sha256 bc7b9d4c041fe8454892a4211a116a4d5243cb04583a18c5292914fc829cb2f6  rustc-1.29.2-src.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 541e49d43d..bf110f8ade 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.27.2
+RUST_VERSION = 1.29.2
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
