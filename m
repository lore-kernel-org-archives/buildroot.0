From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 20:50:53 +0200
Subject: [Buildroot] [git commit] rust-bin: use HOST_RUST_BIN_DL_DIR instead
 of RUST_BIN_DL_DIR
Message-ID: <20180402185204.AC52A8144C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bec950dde82c255c5cab2af46be7cd56ca7aee1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infrastructure only provides HOST_RUST_BIN_DL_DIR, because this
package is host only. Ideally the infra should provide RUST_BIN_DL_DIR,
but it doesn't currently, and that requires more significant changes.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 759d468304..b57849093d 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -22,7 +22,7 @@ HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAM
 define HOST_RUST_BIN_LIBSTD_EXTRACT
 	mkdir -p $(@D)/std
 	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
-		$(call suitable-extractor,$(f)) $(RUST_BIN_DL_DIR)/$(f) | \
+		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
 	cd $(@D)/rustc/lib/rustlib; \
