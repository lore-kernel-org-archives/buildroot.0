From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:31:00 +0200
Subject: [Buildroot] [git commit] package/rust: drop reference to
 HOST_RUST_JEMALLOC_CONF
Message-ID: <20200727112613.8212F88F5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2681d433104627fc38b9da8c764430bb56d0adee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable is no longer used since
4e3be3ae9d4c9f1b0c035eee0c923a724f9a9316 ("package/rust: bump version
to 1.33.0")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust/rust.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 31721f1dd6..adcadc01e7 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -65,7 +65,6 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'channel = "stable"'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
-		echo $(HOST_RUST_JEMALLOC_CONF); \
 	) > $(@D)/config.toml
 endef
 
