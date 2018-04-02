From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 20:36:22 +0200
Subject: [Buildroot] [PATCH 1/5] cargo: use HOST_CARGO_DL_DIR instead of
 CARGO_DL_DIR
Message-ID: <20180402183626.7769-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The infrastructure only provides HOST_CARGO_DL_DIR, because this
package is host only. Ideally the infra should provide CARGO_DL_DIR,
but it doesn't currently, and that requires more significant changes.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/cargo/cargo.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index 36b2718e90..b3174f5b20 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -37,7 +37,7 @@ HOST_CARGO_HOME = $(HOST_DIR)/share/cargo
 define HOST_CARGO_EXTRACT_DEPS
 	@mkdir -p $(@D)/vendor
 	$(call suitable-extractor,$(CARGO_DEPS_SOURCE)) \
-		$(CARGO_DL_DIR)/$(CARGO_DEPS_SOURCE) | \
+		$(HOST_CARGO_DL_DIR)/$(CARGO_DEPS_SOURCE) | \
 		$(TAR) --strip-components=1 -C $(@D)/vendor $(TAR_OPTIONS) -
 endef
 
@@ -46,7 +46,7 @@ HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_DEPS
 define HOST_CARGO_EXTRACT_INSTALLER
 	@mkdir -p $(@D)/src/rust-installer
 	$(call suitable-extractor,$(CARGO_INSTALLER_SOURCE)) \
-		$(CARGO_DL_DIR)/$(CARGO_INSTALLER_SOURCE) | \
+		$(HOST_CARGO_DL_DIR)/$(CARGO_INSTALLER_SOURCE) | \
 		$(TAR) --strip-components=1 -C $(@D)/src/rust-installer $(TAR_OPTIONS) -
 endef
 
-- 
2.16.2
