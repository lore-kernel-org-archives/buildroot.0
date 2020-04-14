From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 12:55:00 -0500
Subject: [Buildroot] [PATCH v2] package/netsnmp: unix domain socket transport
Message-ID: <20200414175500.28891-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Steffens <ryan.steffens@rockwellcollins.com>

Adds support for connecting unix socket based AgentX subagents

Signed-off-by: Ryan Steffens <ryan.steffens@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v1 -> v2
 - (Thomas) Added a commit message about why
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
-- 
2.17.1
