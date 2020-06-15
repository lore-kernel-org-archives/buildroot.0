From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 11:46:32 +0200
Subject: [Buildroot] [git commit] package/systemd: sync user comments to
 upstream
Message-ID: <20200615094512.91CBA815B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80d6aea2ec687a4433b47e373781da4163bd6372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The necessary system users are documented in the projects README.

Description is matched to the ones in the upstream sysusers.d
files. Remove homedirectory (upstream doesnt care either).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f627ce6cd8..1fcffdb3a9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -214,7 +214,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
 SYSTEMD_CONF_OPTS += -Dremote=true
-SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
+SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * - - - systemd Journal Remote
 else
 SYSTEMD_CONF_OPTS += -Dremote=false
 endif
@@ -358,7 +358,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
-SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
+SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
@@ -378,7 +378,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
-SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
+SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
 SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
 define SYSTEMD_INSTALL_NETWORK_CONFS
@@ -397,7 +397,7 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 		$(TARGET_DIR)/etc/resolv.conf
 endef
 SYSTEMD_CONF_OPTS += -Dnss-resolve=true -Dresolve=true
-SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
+SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - systemd Resolver
 else
 SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
 endif
@@ -414,7 +414,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
-SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
+SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - systemd Time Synchronization
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
