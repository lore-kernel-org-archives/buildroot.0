From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Wed, 15 Jan 2020 14:26:12 +0100
Subject: [Buildroot] [PATCH v2 4/9] package/rust: drop dependency on
 host-cargo-bin
In-Reply-To: <20200115132617.26604-1-patrick.havelange@essensium.com>
References: <20200115132617.26604-1-patrick.havelange@essensium.com>
Message-ID: <20200115132617.26604-4-patrick.havelange@essensium.com>
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
2.17.1
