From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:30:19 +0200
Subject: [Buildroot] [git commit] irqbalance: add optional numactl dependency
Message-ID: <20180925204029.4E14D88DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd9ac3d8fea8a06e48496026b9433ef7c6e5d8be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
