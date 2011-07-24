From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 24 Jul 2011 23:11:17 +0200
Subject: [Buildroot] [git commit] iptables: fixup multitarget binary links
Message-ID: <20110724211847.299F08B487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=332dd196cad4fa1a9b0257b08091b902efa5a7c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer vesions renamed iptables-multi to xtables-multi so fix
the symlinks accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/iptables.mk |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 13d2ac3..c464e6b 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -14,15 +14,15 @@ IPTABLES_DEPENDENCIES = host-pkg-config
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 
 define IPTABLES_TARGET_SYMLINK_CREATE
-	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables
-	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables-save
-	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables-restore
+	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables
+	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables-save
+	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables-restore
 endef
 
 define IPTABLES_TARGET_IPV6_SYMLINK_CREATE
-	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables
-	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
-	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
+	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/ip6tables
+	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
+	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
 endef
 
 define IPTABLES_TARGET_IPV6_REMOVE
@@ -40,6 +40,7 @@ endif
 define IPTABLES_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/iptables-xml
 	rm -f $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/sbin/ip6tables*
+	rm -f $(TARGET_DIR)/usr/sbin/xtables-multi
 	rm -rf $(TARGET_DIR)/usr/lib/xtables
 endef
 
-- 
1.7.3.4
