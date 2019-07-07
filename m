From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:41:15 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] boot/barebox: needs
 host-{flex, bison}
Message-ID: <20190707063940.A27EA83ACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=769ce63723a33c48ab4b5d22ad7a22abde699735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Barebox starting from 2019.02 no longer ships flex/bison generated
parser. Add conditional kconfig dependencies, same as we did for kernel
and uboot.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e7d8d9a765b61f0c464abea37a9568c1ae7a25c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 9e8a9f67b5..52178d89c8 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -76,6 +76,10 @@ $(1)_KCONFIG_FRAGMENT_FILES = $$(call qstrip,$$(BR2_TARGET_$(1)_CONFIG_FRAGMENT_
 $(1)_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 $(1)_KCONFIG_OPTS = $$($(1)_MAKE_FLAGS)
 
+$(1)_KCONFIG_DEPENDENCIES = \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_FLEX_HOST_DEPENDENCY)
+
 ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 define $(1)_BUILD_BAREBOXENV_CMDS
 	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
