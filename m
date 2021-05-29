From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 May 2021 10:37:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.52.1
Message-ID: <20210529083710.2471632-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release disables incremental compilation, unless the user has
explicitly opted in via the newly added RUSTC_FORCE_INCREMENTAL=1
environment variable.

This is due to the widespread, and frequently occuring, breakage
encountered by Rust users due to newly enabled incremental verification
in 1.52.0.

https://github.com/rust-lang/rust/blob/1.52.1/RELEASES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rust-bin/rust-bin.hash | 96 +++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |  2 +-
 package/rust/rust.hash         |  6 +--
 package/rust/rust.mk           |  2 +-
 4 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 0800dcca97..b1f697f30c 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,51 +1,51 @@
-# From https://static.rust-lang.org/dist/rust-1.52.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.52.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  b0f504d3dcd744988a1a69716bbf6e2dac872c55e546748ceab8ff1d4fd2da5c  rust-1.52.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  d440cb932bbaaf43b600bd47b2dd4a05bc669a74d88addeeb943d694638d8e6e  rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  3720d98988302bc1f676cef2ea3b2a641404cbbe2d47d0f28f8954658586aa12  rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  593ec073c273028f60cf49d6084ee1809e075682f3e65f9cc86067f84f71d5f7  rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  c251bf48962ff8f96e3572cecee12b1b3286477e66cb9c42c1fbe0118d6bdaf5  rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  c28c6870b9717c6c2e2015a6a5581ccb130f9d393db8166da4513680fe03d4ea  rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  f4d094e1cd73372f1565473b072e22278afeb2b728a178e6e9f1c813a9b76c23  rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  54749b579a8426dd46afe67feb3c206b0b129e59873a443dcd93ed51232a37d6  rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  51492598343e5490c620fd04a16c3f41e2fe9f52232dc67fc1bc937233a2e85d  rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  8db8fac92466389629055d590ca06b7ef1c82621f05cba709413f2ce2c3c5407  rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  824391b79c9b28be7a18feab1adb0eed1a9459667e93572fc8b343985ca965ba  rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  a6de773dfcdc8cac832ac6c356e2c0ecfd94fd7f7242aac82f8922f5bd1639e9  rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  2ad7e17bcb8f632eb4206294ab977bbe1b7562009a3ca84a8d753ff454b1ee07  rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  a792384afe034322b4b430049f57ed5e5fe9efbcf74c13c3edaf04062392727a  rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  af5256a5f1cb189415b0d6b3e349312bbe8a78331a817c8da79ccfe9a07c0aed  rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  dcdc0083facd6484527494ee5b8f72e040a095ab346bb658ce176be573d5c9b4  rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.52.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.52.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  7869459a1550166361a6509473ac9a03eb4019d74d32f79022860852b882fdb6  rust-1.52.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.52.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.52.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  04df0b61eb1d5d9dd5793191121f5e7029d33a50f0fe2ae3ef3ec3d22899d855  rust-1.52.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  c26b9ddac553ecee1b98ae0f068f98296ec14943eb3cd7bb2b410cadc48897ad  rust-std-1.52.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  e877ba486cc702f2b0b0a47709b37a5492f9453aeb6b9d53b15b5a004a2f08da  rust-std-1.52.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  990e90fc6e1e66199ed6c9cf107e84889b659a72727c1a64bd16a9db2b4fb883  rust-std-1.52.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  f8d54814511ea0d1e44242c8d3c5831c920d76451c1ec2474f5807ce879015c2  rust-std-1.52.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-i586-unknown-linux-gnu.tar.xz.asc
+sha256  acdad76eb883a651344a9e039ea88a7faa825d3e45cd8a739bcf1e8cb25b6e23  rust-std-1.52.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  0aab7cb58db16c7448eb275c16c8259e2c5a31ff426e3b857e959daf9af43640  rust-std-1.52.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  2176065be3a1eef352816368b7e030abf19e66020bafa91bedbc400e11267a77  rust-std-1.52.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  d74295493094ca1c8d7ececceac39ae6c97bc358ea03d04cdb72208b5ac4c09e  rust-std-1.52.1-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  ba6928b1413832fdb50644da13e17acdc7c0ce391dbd95ea16b102a0c9f26d46  rust-std-1.52.1-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  16b0d7908517819a6d13f7562c84bdf10b3ed8cf871abcaeb3390beb4123af31  rust-std-1.52.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  fbb29f2c792b616959bed18b5b6c55ba49ffaa8a56ecb5cc7b81328b3b1a1e76  rust-std-1.52.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  1c54030574b2b5468ac7be27047b01f67e0ceb015ba5708e1b67dcd219401dc4  rust-std-1.52.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  a990563211cf0240232d8321a093656fa4398b37e92738a7b420dd85de0edce6  rust-std-1.52.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  5dfeffb7e6600c311cc7208142bd66367a62a02d593903d3ac940d0a31350fce  rust-std-1.52.1-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 71cd8361b3..beb43954ae 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.52.0
+RUST_BIN_VERSION = 1.52.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index faf2db5cb6..286cac6c52 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.52.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.52.0-src.tar.xz.asc
-sha256  2393e923087f3f8f98190eb0743f1b4a8956a35274ae5d3c0fae6e43238c6af8  rustc-1.52.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.52.1-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.52.1-src.tar.xz.asc
+sha256  521bbaebce262264e44acb164d327cba27acf6f08bd7de672d8d1e16e7ed959e  rustc-1.52.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 66a0c0c8c2..7a6d95c364 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.52.0
+RUST_VERSION = 1.52.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.30.2
