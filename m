From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 18:20:52 +0200
Subject: [Buildroot] [git commit] package/netsnmp: unix domain socket
 transport
Message-ID: <20200418160725.A3F328F10A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8aef2d3a5b1e56c82d4d61deded1a742899b1a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The support for Unix domain socket transport was disabled as part of
the bump of netsnmp from 5.5 to 5.6 in commit
de642c9904b13914017af6f10db144d559d6bd0c, but with no apparent reason.

This support is needed to allow Unix socket based AgentX subagents to
connect to netsnmp, so let's re-enable it.

Signed-off-by: Ryan Steffens <ryan.steffens@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsnmp/netsnmp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index ed573c51e3..904279d1fb 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -30,7 +30,6 @@ NETSNMP_CONF_OPTS = \
 	--with-sys-location="Unknown" \
 	--with-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES))" \
 	--with-out-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
-	--with-out-transports="Unix" \
 	--disable-manuals
 NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
