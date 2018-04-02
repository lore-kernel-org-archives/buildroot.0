From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 15:11:49 +0200
Subject: [Buildroot] [git commit] ncmpc: add optional dependency to
 lirc-tools
Message-ID: <20180402131247.62AA88125F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1189d03fe70f8b74384649d9a9edbacca3586240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
