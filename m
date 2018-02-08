From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:28:52 +0100
Subject: [Buildroot] [git commit] rust-bin: fix indentation
Message-ID: <20180208222906.8C8E786FFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9600ed45e2745256d259272544870ee735ffa624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following check-package warning:

./package/rust-bin/rust-bin.mk:27: expected indent with tabs

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 255573e582..5ace7bf08f 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -24,7 +24,7 @@ define HOST_RUST_BIN_LIBSTD_EXTRACT
 	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
 		$(call suitable-extractor,$(f)) $(DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
-        )
+	)
 	cd $(@D)/rustc/lib/rustlib; \
 		ln -sf ../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUST_HOST_NAME)
 endef
