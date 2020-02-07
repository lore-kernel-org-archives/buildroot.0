From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  7 Feb 2020 19:08:23 +0100
Subject: [Buildroot] [PATCH v3 04/10] package/rust-bin: host variant depends
 on host-cargo-bin
In-Reply-To: <20200207180829.165689-1-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
Message-ID: <20200207180829.165689-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Ensure installation of pre-built cargo binary by adding it to the
dependency list of the host variant of the pre-built Rust compiler.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
2.24.1
