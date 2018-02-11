From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Feb 2018 17:58:23 +0100
Subject: [Buildroot] [PATCH 5/6] cargo: use RUSTC_{HOST,TARGET}_NAME
In-Reply-To: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
References: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180211165824.20213-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo/cargo.mk  | 2 +-
 package/cargo/config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index 5625127fcd..3fd088d727 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -82,7 +82,7 @@ define HOST_CARGO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/target/release/cargo $(HOST_DIR)/bin/cargo
 	$(INSTALL) -D package/cargo/config.in \
 		$(HOST_DIR)/share/cargo/config
-	$(SED) 's/@RUST_TARGET_NAME@/$(RUST_TARGET_NAME)/' \
+	$(SED) 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
 		$(HOST_DIR)/share/cargo/config
 	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
 		$(HOST_DIR)/share/cargo/config
diff --git a/package/cargo/config.in b/package/cargo/config.in
index cc048c71c4..47fad026be 100644
--- a/package/cargo/config.in
+++ b/package/cargo/config.in
@@ -1,2 +1,2 @@
-[target. at RUST_TARGET_NAME@]
+[target. at RUSTC_TARGET_NAME@]
 linker = "@CROSS_PREFIX at gcc"
-- 
2.14.3
