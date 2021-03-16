From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 21:13:41 +0100
Subject: [Buildroot] [git commit] package/batman-adv: needs linux kernel
 libcrc32c support
Message-ID: <20210316195048.3843D86461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6754f656dede40d380f56086849fdd4092b15846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  ERROR: modpost: "crc32c" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/batman-adv/batman-adv.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 2de92d6543..194951a712 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -34,5 +34,9 @@ define BATMAN_ADV_CONFIGURE_CMDS
 	$(BATMAN_ADV_MODULE_MAKE_OPTS) $(@D)/gen-compat-autoconf.sh $(@D)/compat-autoconf.h
 endef
 
+define BATMAN_ADV_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LIBCRC32C)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
