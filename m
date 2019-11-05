From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  5 Nov 2019 22:12:55 +0100
Subject: [Buildroot] [RFC PATCH 3/7] package/rust-bin: host variant depends
 on host-cargo-bin
In-Reply-To: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
References: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191105211259.27673-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ensure installation of pre-built cargo binary by adding it to the
dependency list of the host variant of the pre-built Rust compiler.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust-bin/rust-bin.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index a374215e20..bef3102450 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -10,6 +10,7 @@ RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
 HOST_RUST_BIN_PROVIDES = host-rustc
+HOST_RUST_BIN_DEPENDENCIES = host-cargo-bin
 
 HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 
-- 
2.21.0
