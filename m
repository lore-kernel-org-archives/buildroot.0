From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  5 Nov 2019 22:12:56 +0100
Subject: [Buildroot] [RFC PATCH 4/7] package/rust: drop dependency on
 host-cargo-bin
In-Reply-To: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
References: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191105211259.27673-5-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As host-rust depends on host-rust-bin, which depends on host-cargo-bin,
remove unneeded dependency.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust/rust.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 901995c203..50ed08901c 100644
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
2.21.0
