From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  6 Apr 2019 16:42:10 +0200
Subject: [Buildroot] [PATCH 2/3] rust-bin: bump version to 1.33.0
In-Reply-To: <20190406144211.20894-1-eric.le.bihan.dev@free.fr>
References: <20190406144211.20894-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190406144211.20894-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust-bin/rust-bin.hash | 75 ++++++++++++++++++++--------------
 package/rust-bin/rust-bin.mk   |  7 ++--
 2 files changed, 49 insertions(+), 33 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 36f959f257..96d81a347c 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,33 +1,48 @@
-# From https://static.rust-lang.org/dist/rustc-1.29.2-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 d251b3ade6a66856ff62ea86ed8d34f8cc2a9cd683bf42c3b0c0345f0d955b7c  rustc-1.29.2-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rustc-1.29.2-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 b0ea41cd20caf9af62394601b09d2c8b12814293f3cc1247a8c61fb672477499  rustc-1.29.2-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256 df62bdb6839e313f8f9c3a92b4de63ba2c37b9c7b534449a392db1ede0f6a741  rust-std-1.29.2-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256 7729765dab2945c688d0f10faf313c14aed22f6cfdc96a0a07292292662f260a  rust-std-1.29.2-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 5e4f02edccd013b19b6d03c2a28bff4f81b9cdf7475882e1480aeb21378f93cf  rust-std-1.29.2-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256 d7e6ba57e790fc4e5d02c0b4b0471178b05341cf932bfc349b90ced9b939209e  rust-std-1.29.2-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-i686-unknown-linux-gnu.tar.xz.sha256
-sha256 4e8c54a54b3060cde9e24d0c32585360098cc75a120543429ccf498d8b83b5d0  rust-std-1.29.2-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-mips-unknown-linux-gnu.tar.xz.sha256
-sha256 556596ac7e2dc462573e8379fd1596dc59394044b3a11f0c50f54642439cf8ab  rust-std-1.29.2-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 8dac2dfc4db7932e6214e98494824453a7be8bb42cf29d5395cc2363fc2fb0c2  rust-std-1.29.2-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-sha256 361d70abfc27b7fdbe8642bc7413f9b55463e90350465de96183ff048fcf149f  rust-std-1.29.2-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-mipsel-unknown-linux-gnu.tar.xz.sha256
-sha256 8005463e56932bdf272a047281cc20087db68d8fef4cbcf8cf4edf9a2260f8cc  rust-std-1.29.2-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256 6cda45f5ee39dbfef95d516a1e0e25744b11d1a8147188b71c21f85f65bca9a9  rust-std-1.29.2-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256 612f175c895a495e401205025805a9e8dffa53b2f105a55f92894b159a87fe28  rust-std-1.29.2-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256 16034975bd09b57eb1579b659010f83b869733c9c018c2a189a385fa77923875  rust-std-1.29.2-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.29.2-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256 be16e9db4e39e5e1af0621eea715d13e0fdc56f7b14c3d7310905dc34dfa618a  rust-std-1.29.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.33.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.33.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 90b6414eddbce4a245cdcaea8353d3a637ef565d2bd119e25a6c2bf3e38cdf63  rustc-1.33.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.33.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.33.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 57c5ced1a826d34f26e50adf041528dd0000f2a59e8be32d2359386843382ce1  rustc-1.33.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256 3e3449dada8306b3ff91f23c7803c7312a47e93af140f757b29b74f1e226a505  rust-std-1.33.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256 ddb372a43fb2ba9949e78643df43d6ae447b70cefd440ccdd6b9f6c2ff929ea7  rust-std-1.33.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256 1142d5064d8cbfab16ab71130e5a84804a1ebdfeb10173e6238adc0d757937b6  rust-std-1.33.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256 8492b5c91a9ea7ee7e22881382c1b9ad8bb9a4147aff0dfee09940b34783e3d5  rust-std-1.33.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256 e945dd37ab9b143dbcbcdbeaba63b8de47411a4ff815d2e178f745e183078127  rust-std-1.33.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256 abf6b7050c1cdef092ecfde5128067434bb7989def19cfe95c06bfd71de07ba0  rust-std-1.33.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256 9cad816c989c991ffd342d03956b54209d7d32743ebb9b0624b2d36d5bbd525f  rust-std-1.33.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256 c7ac98e7a7c3757b5bb8bde596455d50a8787236e290bc1f49e2d59d486ae564  rust-std-1.33.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256 4ec3cade12e2e527f81d0b315e6a37152bf73938aab4a9216aef7d06ef913eb6  rust-std-1.33.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256 0ab78e0cb710f35d108abce90bbf426947fed6222d2f6c04c9eba4ca00adea06  rust-std-1.33.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256 4bc32bf4660a9fc5cd2af9e09f1bfb668b335442097fed6f3892b50950e97d3c  rust-std-1.33.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256 984d3ca2a47db04345a2bddd657761f66d209ef95a02097ad4bd549f45a0dc9f  rust-std-1.33.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.33.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.33.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256 6f20343ed73faf5fdfc423bec38a9bb1910a0a962af6f2dddd7184407543ed0e  rust-std-1.33.0-x86_64-unknown-linux-gnu.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 624ec94b40..a374215e20 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.29.2
+RUST_BIN_VERSION = 1.33.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
@@ -28,8 +28,9 @@ define HOST_RUST_BIN_LIBSTD_EXTRACT
 		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
-	cd $(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME); \
-		ln -sf ../../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)/lib
+	mkdir -p $(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME)/lib
+	cd $(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME)/lib; \
+		ln -sf ../../../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)/lib/* .
 endef
 
 HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
-- 
2.17.2
