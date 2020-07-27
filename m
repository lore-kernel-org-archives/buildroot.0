From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:31:00 +0200
Subject: [Buildroot] [git commit] package/rust-bin: host variant depends on
 host-cargo-bin
Message-ID: <20200727112613.322D388F5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f89b8dcb161910e5b08615a2824793b564589cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure installation of pre-built cargo binary by adding it to the
dependency list of the host variant of the pre-built Rust compiler.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
