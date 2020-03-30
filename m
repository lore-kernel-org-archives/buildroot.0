From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 30 Mar 2020 16:46:13 -0700
Subject: [Buildroot] [PATCH 2/5] linux: add automatic nftables config
 selection
In-Reply-To: <20200330234616.1665466-1-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
Message-ID: <20200330234616.1665466-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Select the minimum amount of kernel features to enable nftables when the
nftables package is selected.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1927832e7e..3c797aab88 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -389,6 +389,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))
+	$(if $(BR2_PACKAGE_NFTABLES),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET,$(@D)/.config))
 	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
-- 
2.25.1
