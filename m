From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:24 +0100
Subject: [Buildroot] iptables: bump version
In-Reply-To: <1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
References: <> <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- bump version to 1.4.2
- add uninstall target
---
 package/iptables/iptables.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index fbb5f18..93f2c32 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.1
+IPTABLES_VERSION = 1.4.2
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
@@ -16,3 +16,10 @@ IPTABLES_CONFIGURE_OPT = --with-kernel=$(LINUX_HEADERS_DIR)
 IPTABLES_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
 
 $(eval $(call AUTOTARGETS,package,iptables))
+
+$(IPTABLES_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/iptables-xml
+	rm -f $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/sbin/ip6tables*
+	rm -rf $(TARGET_DIR)/usr/lib/xtables
+	rm -f $(IPTABLES_TARGET_INSTALL_TARGET)
-- 
1.5.4.3
