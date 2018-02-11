From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Feb 2018 17:58:24 +0100
Subject: [Buildroot] [PATCH 6/6] docs/manual: use RUSTC_{HOST,
 TARGET}_NAME in cargo howto
In-Reply-To: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
References: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180211165824.20213-7-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/adding-packages-cargo.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 3f9ddfed16..b78163e6a1 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -49,11 +49,11 @@ package. Let's start with an example:
 15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
 17:
-18: FOO_BIN_DIR = target/$(RUST_TARGET_NAME)/$(FOO_CARGO_MODE)
+18: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
 19:
 20: FOO_CARGO_OPTS = \
 21:   --$(FOO_CARGO_MODE) \
-22: 	--target=$(RUST_TARGET_NAME) \
+22: 	--target=$(RUSTC_TARGET_NAME) \
 23: 	--manifest-path=$(@D)/Cargo.toml
 24:
 25: define FOO_BUILD_CMDS
-- 
2.14.3
