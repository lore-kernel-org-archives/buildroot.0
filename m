From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:39:30 +0200
Subject: [Buildroot] [git commit] package/nftables: bear the kernel options
 munging
Message-ID: <20200624213725.72EDA84022@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=999e28dc1d2f305f76c162668c58012a9035ae80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
