From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Feb 2018 17:58:22 +0100
Subject: [Buildroot] [PATCH 4/6] rust: use RUSTC_{HOST,TARGET}_NAME
In-Reply-To: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
References: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180211165824.20213-5-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust/rust.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 6d6ac4370a..ff2634b996 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -48,7 +48,7 @@ HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
 define HOST_RUST_CONFIGURE_CMDS
 	( \
 		echo '[build]'; \
-		echo 'target = ["$(RUST_TARGET_NAME)"]'; \
+		echo 'target = ["$(RUSTC_TARGET_NAME)"]'; \
 		echo 'cargo = "$(HOST_CARGO_BIN_DIR)/cargo/bin/cargo"'; \
 		echo 'rustc = "$(HOST_RUST_BIN_DIR)/rustc/bin/rustc"'; \
 		echo 'python = "$(HOST_DIR)/bin/python2"'; \
@@ -61,7 +61,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'prefix = "$(HOST_DIR)"'; \
 		echo '[rust]'; \
 		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
-		echo '[target.$(RUST_TARGET_NAME)]'; \
+		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo $(HOST_RUST_JEMALLOC_CONF); \
 	) > $(@D)/config.toml
-- 
2.14.3
