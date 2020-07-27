From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:31:00 +0200
Subject: [Buildroot] [git commit] package/rust: drop dependency on
 host-cargo-bin
Message-ID: <20200727112613.3E73388E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71f18cef3979b2f24822e048cce46bc2dfc8b5c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As host-rust depends on host-rust-bin, which depends on host-cargo-bin,
remove unneeded dependency.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust/rust.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 6bee04b3b9..c05d912ffa 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -15,7 +15,6 @@ HOST_RUST_PROVIDES = host-rustc
 HOST_RUST_DEPENDENCIES = \
 	toolchain \
 	host-rust-bin \
-	host-cargo-bin \
 	host-openssl \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
 
