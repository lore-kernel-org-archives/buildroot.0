From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Feb 2018 17:58:20 +0100
Subject: [Buildroot] [PATCH 2/6] rust-bin: use RUSTC_{HOST,TARGET}_NAME
In-Reply-To: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
References: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180211165824.20213-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust-bin/rust-bin.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 5ace7bf08f..cd5844b115 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -11,13 +11,13 @@ RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
 HOST_RUST_BIN_PROVIDES = host-rustc
 
-HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 
 HOST_RUST_BIN_EXTRA_DOWNLOADS = \
-	rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz \
-	rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME).tar.xz
+	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz \
+	rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
 
-HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME)/rust-std-$(RUST_HOST_NAME)
+HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME)/rust-std-$(RUSTC_HOST_NAME)
 
 define HOST_RUST_BIN_LIBSTD_EXTRACT
 	mkdir -p $(@D)/std
@@ -26,7 +26,7 @@ define HOST_RUST_BIN_LIBSTD_EXTRACT
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
 	cd $(@D)/rustc/lib/rustlib; \
-		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME)
+		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)
 endef
 
 HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
@@ -42,12 +42,12 @@ define HOST_RUST_BIN_INSTALL_RUSTC
 endef
 
 define HOST_RUST_BIN_INSTALL_LIBSTD_HOST
-	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUST_HOST_NAME); \
+	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME); \
 		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
 endef
 
 define HOST_RUST_BIN_INSTALL_LIBSTD_TARGET
-	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUST_TARGET_NAME); \
+	(cd $(@D)/std/rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME); \
 		./install.sh $(HOST_RUST_BIN_INSTALL_OPTS))
 endef
 endif
-- 
2.14.3
