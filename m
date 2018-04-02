From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Apr 2018 13:10:18 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: add optional dependency to lirc-tools
Message-ID: <20180402111018.23661-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 6bce627562..1d464b72de 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -18,6 +18,13 @@ NCMPC_CONF_OPTS += \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
+ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
+NCMPC_DEPENDENCIES += lirc-tools
+NCMPC_CONF_OPTS += -Dlirc=true
+else
+NCMPC_CONF_OPTS += -Dlirc=false
+endif
+
 NCMPC_NINJA_OPTS = $(if $(VERBOSE),-v)
 
 define NCMPC_CONFIGURE_CMDS
-- 
2.14.1
