From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Mar 2021 19:14:28 +0100
Subject: [Buildroot] [PATCH v1 2/3] package/batman-adv: needs linux kernel
 libcrc32c support
In-Reply-To: <20210316181429.30804-1-ps.report@gmx.net>
References: <20210316181429.30804-1-ps.report@gmx.net>
Message-ID: <20210316181429.30804-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  ERROR: modpost: "crc32c" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.30.1
