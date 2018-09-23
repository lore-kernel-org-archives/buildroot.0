From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Sep 2018 18:32:38 +0200
Subject: [Buildroot] [PATCH 1/4] irqbalance: add optional numactl dependency
Message-ID: <20180923163241.26588-1-fontaine.fabrice@gmail.com>
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
index e4e6078bf3..95230ed1f5 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -12,6 +12,13 @@ IRQBALANCE_DEPENDENCIES = host-pkgconf
 # Autoreconf needed because package is distributed without a configure script
 IRQBALANCE_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+IRQBALANCE_DEPENDENCIES += numactl
+IRQBALANCE_CONF_OPTS += --enable-numa
+else
+IRQBALANCE_CONF_OPTS += --disable-numa
+endif
+
 # This would be done by the package's autogen.sh script
 define IRQBALANCE_PRECONFIGURE
 	mkdir -p $(@D)/m4
-- 
2.17.1
