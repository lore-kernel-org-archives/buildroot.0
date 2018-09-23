From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Sep 2018 18:32:40 +0200
Subject: [Buildroot] [PATCH 3/4] irqbalance: add optional libcap-ng
 dependency
In-Reply-To: <20180923163241.26588-1-fontaine.fabrice@gmail.com>
References: <20180923163241.26588-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923163241.26588-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irqbalance/irqbalance.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 309fc22ee2..410e40a131 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -15,6 +15,13 @@ IRQBALANCE_AUTORECONF = YES
 # Local implementation of glib2 will be used if --without-glib2 is set
 IRQBALANCE_CONF_OPTS = --with-glib2
 
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+IRQBALANCE_DEPENDENCIES += libcap-ng
+IRQBALANCE_CONF_OPTS += --with-libcap-ng
+else
+IRQBALANCE_CONF_OPTS += --without-libcap-ng
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 IRQBALANCE_DEPENDENCIES += numactl
 IRQBALANCE_CONF_OPTS += --enable-numa
-- 
2.17.1
