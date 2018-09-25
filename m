From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:31:05 +0200
Subject: [Buildroot] [git commit] irqbalance: add optional libcap-ng
 dependency
Message-ID: <20180925204029.61B9688DC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1811f17c6586cd0c70a5a63e0717a4e2b17c82b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
