From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 5 Jun 2010 21:41:32 +0200
Subject: [Buildroot] [git commit master] iptables: bump version,
	make it smaller with IPV6=n
Message-ID: <20100605194211.E3D5D12F56E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a0ce68d374734c6a7689eecc4b3f4cf6b32a95a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1879

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    1 +
 package/iptables/iptables.mk |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index a3a5203..b1a9a4c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
+	#1879: Bump iptables to 1.4.8
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
 
 2010.05, Released May 30th, 2010:
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index b74321c..3e847d2 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.7
+IPTABLES_VERSION = 1.4.8
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
@@ -25,6 +25,8 @@ ifeq ($(BR2_INET_IPV6),y)
 	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables
 	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
 	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
+else
+	rm -f $(TARGET_DIR)/usr/lib/libip6tc.*
 endif
 	touch $@
 
-- 
1.6.3.3
