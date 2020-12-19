From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2020 12:25:08 +0100
Subject: [Buildroot] [git commit] package/pkg-golang.mk: postpone evaluation
 of TARGET_DIR and HOST_DIR
Message-ID: <20201219110901.81ED282945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d595c0d926d6b352b0e08366095bb92c7318c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PER_PACKAGE_DIRECTORIES=y, $(TARGET_DIR) is evaluated as
$(BASE_DIR)/target, but $$(TARGET_DIR) is evaluated as
$(BASE_DIR)/per-package/$(PKG)_NAME/target.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-golang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 3813e1c406..d07242310d 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -121,7 +121,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(TARGET_DIR)/usr/bin/$$(d)
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
 	)
 endef
 endif
@@ -130,7 +130,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/bin/$$(d)
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
 	)
 endef
 endif
