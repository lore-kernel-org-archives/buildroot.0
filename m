From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 May 2021 22:58:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/rust: security bump to version
 1.52.0
Message-ID: <20210507205844.2911883-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-36317, CVE-2020-36318, CVE-2020-36323, CVE-2021-28877,
CVE-2021-28875, CVE-2021-28876, CVE-2021-28878 and CVE-2021-28879

https://github.com/rust-lang/rust/blob/1.52.0/RELEASES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rust-bin/rust-bin.hash | 96 +++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |  2 +-
 package/rust/rust.hash         |  6 +--
 package/rust/rust.mk           |  2 +-
 4 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 46c023e62f..0800dcca97 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,51 +1,51 @@
-# From https://static.rust-lang.org/dist/rust-1.48.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.48.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  ddbfb5af1cd2cb6ae79d6f3f95cf29c0057e6387eada8b3975e7d7658e315aae  rust-1.48.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.48.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.48.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  58270d8e10f72e1712ba08db6b8f8ffca64a63d1a7b220688b59fb05655b3843  rust-1.48.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  3a50eeb64a63a09f79bee49e01f72410d455b9ae1c7f07ebdb6dc0d40e9aa0bc  rust-std-1.48.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  f512696b54142abda3d68b2ba213ae115d5e898952a50a1fa3d1fe6b4ef71d3c  rust-std-1.48.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  5bc6c5dfcc9c345c3f7af519df8ac77c2b0938ea32aa7949f589bec2c7cd3a22  rust-std-1.48.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  da71ec82973eb6fdf67de25b5a39d9cb4b943ec2c43de570f4785a3a79036430  rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  d700751756d9b6e7881dd3a5f67bec1b998b3e278a113f4de2125f4281deaf5c  rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  d4ea5ca6f9c8f9092b50c879f1d9a2620486f08020fa4cac227743a19f6e8cdf  rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  5c4d49cbd16ac89e39c3cbfae127961289af3419435f2b90e1732a97d9326b35  rust-std-1.48.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  3fd7194abb8f51c3caf09c222c12700cddef73449d38953c6b1adb04a89dcc31  rust-std-1.48.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  9200f952416488bc68857989bc10239e59b44a6c55153cb063fa03f28f5016f8  rust-std-1.48.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  792008f6c9ea68db39e59312fc372bf649980cf676c01a71da7db399de49966c  rust-std-1.48.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  58d0da369bfd71a17d27807ef7c052556a771cf209bee068d44504f554bf2a8c  rust-std-1.48.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  10346635487b14aa4b82baeae02ee5a4bffe930090c6c551083262e9811755f0  rust-std-1.48.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  e42b64c5710d3982f22ed744ea21ef2f0196df908c6a673b6df550904583b1c3  rust-std-1.48.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.48.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  1c00a6a0dabbf6290728b09f9307d9fa6cc985487f727075c68acd4a600ef3f8  rust-std-1.48.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.52.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.52.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  b0f504d3dcd744988a1a69716bbf6e2dac872c55e546748ceab8ff1d4fd2da5c  rust-1.52.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  d440cb932bbaaf43b600bd47b2dd4a05bc669a74d88addeeb943d694638d8e6e  rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  3720d98988302bc1f676cef2ea3b2a641404cbbe2d47d0f28f8954658586aa12  rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  593ec073c273028f60cf49d6084ee1809e075682f3e65f9cc86067f84f71d5f7  rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  c251bf48962ff8f96e3572cecee12b1b3286477e66cb9c42c1fbe0118d6bdaf5  rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  c28c6870b9717c6c2e2015a6a5581ccb130f9d393db8166da4513680fe03d4ea  rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  f4d094e1cd73372f1565473b072e22278afeb2b728a178e6e9f1c813a9b76c23  rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  54749b579a8426dd46afe67feb3c206b0b129e59873a443dcd93ed51232a37d6  rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  51492598343e5490c620fd04a16c3f41e2fe9f52232dc67fc1bc937233a2e85d  rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  8db8fac92466389629055d590ca06b7ef1c82621f05cba709413f2ce2c3c5407  rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  824391b79c9b28be7a18feab1adb0eed1a9459667e93572fc8b343985ca965ba  rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  a6de773dfcdc8cac832ac6c356e2c0ecfd94fd7f7242aac82f8922f5bd1639e9  rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  2ad7e17bcb8f632eb4206294ab977bbe1b7562009a3ca84a8d753ff454b1ee07  rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  a792384afe034322b4b430049f57ed5e5fe9efbcf74c13c3edaf04062392727a  rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  af5256a5f1cb189415b0d6b3e349312bbe8a78331a817c8da79ccfe9a07c0aed  rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  dcdc0083facd6484527494ee5b8f72e040a095ab346bb658ce176be573d5c9b4  rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 28901e0cfa..71cd8361b3 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.48.0
+RUST_BIN_VERSION = 1.52.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 1c993b9339..faf2db5cb6 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.48.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.48.0-src.tar.xz.asc
-sha256  ff0a242392a1865d7b2d08eb5ca6c1b3fd0820741d4c13a51a4b2d5d2bb53908  rustc-1.48.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.52.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.52.0-src.tar.xz.asc
+sha256  2393e923087f3f8f98190eb0743f1b4a8956a35274ae5d3c0fae6e43238c6af8  rustc-1.52.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index a38a3d64f5..66a0c0c8c2 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.48.0
+RUST_VERSION = 1.52.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.30.2
