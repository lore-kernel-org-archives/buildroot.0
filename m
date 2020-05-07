From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  7 May 2020 16:14:53 -0700
Subject: [Buildroot] [PATCH/next v4 1/5] package/nftable: bear the kernel
 options munging
Message-ID: <20200507231457.2093052-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add this patch to the series

 package/nftables/nftables.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 7f797797db..c5503e2039 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -47,4 +47,10 @@ endif
 
 NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
 
+define NFTABLES_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+endef
+
 $(eval $(autotools-package))
-- 
2.26.2
