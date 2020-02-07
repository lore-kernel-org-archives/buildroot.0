From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  7 Feb 2020 19:08:24 +0100
Subject: [Buildroot] [PATCH v3 05/10] package/rust: drop dependency on
 host-cargo-bin
In-Reply-To: <20200207180829.165689-1-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
Message-ID: <20200207180829.165689-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

As host-rust depends on host-rust-bin, which depends on host-cargo-bin,
remove unneeded dependency.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rust/rust.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 9bbed15082..588e1088f8 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -15,7 +15,6 @@ HOST_RUST_PROVIDES = host-rustc
 HOST_RUST_DEPENDENCIES = \
 	toolchain \
 	host-rust-bin \
-	host-cargo-bin \
 	host-openssl \
 	host-python \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
-- 
2.24.1
