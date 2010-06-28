From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Mon, 28 Jun 2010 15:03:30 +0100
Subject: [Buildroot] [PATCH] linux-fusion: Fix build.
Message-ID: <AB12B32E73474741A2C5361C433A44DE01E38F06@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The headers_install target no longer exists in the Makefile, the
installation of headers is done by the install target.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk
b/package/linux-fusion/linux-fusion.mk
index c9ebed7..54f53a3 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -37,7 +37,7 @@ define LINUX_FUSION_INSTALL_STAGING_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(LINUX_FUSION_MAKE_OPTS) \
 		INSTALL_MOD_PATH=$(STAGING_DIR) \
-		-C $(@D) headers_install
+		-C $(@D) install
 endef
 
 define LINUX_FUSION_INSTALL_TARGET_CMDS
-- 
1.7.1
