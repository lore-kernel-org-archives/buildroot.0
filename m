From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:45 -0000
Subject: [Buildroot] [git commit] package/{rust,rust-bin}: bump to 1.45.2
Message-ID: <20200902161634.C2A3F85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7653028af07c1a62e6e9d117b789d55812a9c31a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- APPENDIX (entitled : how to apply the Apache License to your work)
  has been removed from the end of LICENSE-APACHE.
- Bug fixes and API enhancement, a detailed list is available at :
  https://github.com/rust-lang/rust/blob/master/RELEASES.md

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 92 +++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |  2 +-
 package/rust/rust.hash         |  8 ++--
 package/rust/rust.mk           |  2 +-
 4 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 5330b19d97..dd81edd581 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,48 +1,48 @@
-# From https://static.rust-lang.org/dist/rust-1.40.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.40.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256 82454e1b60b2bc24779d9c949cc0e1da43f3e423dbfc6b45b5afddf65829fc9d  rust-1.40.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.40.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.40.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 37492d6467bcea611b2c7388aed50b655524f81410e255142ef6cfb6cef1ec53  rust-1.40.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256 1abd1865e8339c2cac6992a11f6f98b66fa2b97f67acaddcf1992e39a7001bfc  rust-std-1.40.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256 14bd261dfc586dc8e1cb336b3c58b63de2af4881c970dd9b1e87f1364a866bcb  rust-std-1.40.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256 f16b2cf9103127140f85d21c2753d85d45b90a9309967e3a788867fd7d95a6c1  rust-std-1.40.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256 9d4aad78db894a76e9682f2095ac024cc4748b2933f9f7248bf571923f7693c4  rust-std-1.40.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256 beab29565d12a6b9db4ef471c34d4c034295760095f7edc3f7b6c51fc08589a0  rust-std-1.40.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256 c25790d43e0a01e5f45607b067b22ae96163d5eae877cee1b2b35ce0d43ab9b5  rust-std-1.40.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256 7000ab95cd64f177af831d8880b9a5d7b5a23e5a18b9e9adab32bf90859bfa4e  rust-std-1.40.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256 9a4cfebee845dfd50f0f10c3019b89af3747c3aed1a797042285f3cea5a3eb30  rust-std-1.40.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256 ab738a37c1cac1aaec7cb34556fa9bfff46dc912baf360a27e9d81311120ec4a  rust-std-1.40.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256 5c29b326d4d564c9fa9b82292890f47794496d3cedf106f83f935189b7ecaca5  rust-std-1.40.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256 da7af341b3a01f684a2d9fea23f098816aa8a0f9588b58d25ec7f0622743b5b0  rust-std-1.40.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256 4eb3141fb6c3d3e101b5d4493664c9a01d4bb9eebdf4b96f5c26a81188c2452d  rust-std-1.40.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.40.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.40.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256 5a0b14a51f51b0194f70a2023749d9cb49c3b2e11f0d4c8232960b91fad336ac  rust-std-1.40.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.45.2-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.45.2-i686-unknown-linux-gnu.tar.xz.asc
+sha256 42c25bea5c6dc35e89c65217477880aa52ee95b85271192f7e6833c80f3761f0  rust-1.45.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.45.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.45.2-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 39455d1ebd6f386e50748f566e1b37780f236c1f3cbc869690653662beca1ea9  rust-1.45.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256 d0006b1ec413cd0f698195584cc478d3ceb44ea4232fe1971970be22f1470e1d  rust-std-1.45.2-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256 68ec96eadf94aa409a74e1ac1cf56c578c539cae8c238664b1805374037ac1b3  rust-std-1.45.2-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256 63d539b8ec09d6f555106a41278456dc443a88259eb4693f1c834b3dc2529616  rust-std-1.45.2-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256 f60ddfcbc6e7292b1b2a5145c93463cdc0e0811c95e3b426f629fcab9e24588b  rust-std-1.45.2-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-i686-unknown-linux-gnu.tar.xz.asc
+sha256 05474dbec0385c8dcfd940e6f8954d4f8284745a4fbcf57932022b1593829463  rust-std-1.45.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mips-unknown-linux-gnu.tar.xz.asc
+sha256 6add56f405fac0306b7d966b842dfe6d6beb4eaa93492eac7ac74015ceaeba7e  rust-std-1.45.2-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256 107931f34646486211dcc582b6c4c58b17379025969b4d0f17c52d219483e66f  rust-std-1.45.2-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256 6f7dbbc7098c1a5af5e6490c8335eb8f8b8a53de9773199ac65c02e099956d58  rust-std-1.45.2-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256 6e7638cd370e0e5aa455d325a5f66b20c677fa3abb24bbf2519fc97ba3ac78ba  rust-std-1.45.2-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256 c6ad70fc0b052ceba0f886d2431dbd23fd444ad307c0f2f4932ccc7af246bd73  rust-std-1.45.2-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256 11edc189ea6544018ee74df7996d2ee8877a0d8b719a31b7e7a33d71bba9013c  rust-std-1.45.2-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256 0a000c2e047c675bee27c2287b2e03fe21148ead95c35b884846a8dc7c3c162d  rust-std-1.45.2-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.45.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.45.2-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 02309322467af8e37256ccf1f064f5233c7fca4423dffde0bd5eb32cde46942a  rust-std-1.45.2-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
-sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 52ca279c8d..36557048c7 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.40.0
+RUST_BIN_VERSION = 1.45.2
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 67c537f670..e2d3a48e4f 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.40.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.40.0-src.tar.xz.asc
-sha256 6e2aa3a91697f4b225c6b394cbae6b97666f061dba491f666a5281698fe2aace  rustc-1.40.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.45.2-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.45.2-src.tar.xz.asc
+sha256 f8412adac2f5d974b2f06c5bd4be7361084d18a678d098bf05de5ccfa57b74a9  rustc-1.45.2-src.tar.xz
 # Locally generated
-sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256 62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index adcadc01e7..d62f7b7be7 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.40.0
+RUST_VERSION = 1.45.2
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
