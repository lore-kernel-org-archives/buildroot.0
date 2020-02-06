From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:29 +0100
Subject: [Buildroot] [PATCH 06/10] package/systemd: sync user comments to
 upstream
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-7-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Description is matched to the ones in the upstream sysusers.d
files. Remove homedirectory (upstream doesnt care either).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b6bd85f130..6ea25e3363 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -181,7 +181,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
 SYSTEMD_CONF_OPTS += -Dremote=true
-SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
+SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * - - - systemd Journal Remote
 else
 SYSTEMD_CONF_OPTS += -Dremote=false
 endif
@@ -305,7 +305,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
-SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
+SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
@@ -325,7 +325,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
-SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
+SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
 SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
 define SYSTEMD_INSTALL_NETWORK_CONFS
@@ -344,14 +344,14 @@ define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 		$(TARGET_DIR)/etc/resolv.conf
 endef
 SYSTEMD_CONF_OPTS += -Dresolve=true
-SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
+SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - systemd Resolver
 else
 SYSTEMD_CONF_OPTS += -Dresolve=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += -Dtimesyncd=true
-SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
+SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - systemd Time Synchronization
 else
 SYSTEMD_CONF_OPTS += -Dtimesyncd=false
 endif
-- 
2.24.1
