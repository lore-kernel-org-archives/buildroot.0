From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:48:49 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/pkg-golang.mk:
 postpone evaluation of TARGET_DIR and HOST_DIR
Message-ID: <20201222103551.7F0BD884F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d8c5d41666fb83a0e29f98b5affba916501ab69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

When BR2_PER_PACKAGE_DIRECTORIES=y, $(TARGET_DIR) is evaluated as
$(BASE_DIR)/target, but $$(TARGET_DIR) is evaluated as
$(BASE_DIR)/per-package/$(PKG)_NAME/target.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8d595c0d926d6b352b0e08366095bb92c7318c4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 2494ce028c..51ed92c7af 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -141,7 +141,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(TARGET_DIR)/usr/bin/$$(d)
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
 	)
 endef
 endif
@@ -150,7 +150,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/bin/$$(d)
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
 	)
 endef
 endif
