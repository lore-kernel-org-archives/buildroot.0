From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jun 2010 22:35:44 +0200
Subject: [Buildroot] [git commit master] Iptables: needs host-pkg-config
Message-ID: <20100607203608.2176B8DCD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3af86820e225400110947075538d50cfaf860dd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    4 ++--
 package/iptables/iptables.mk |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ccc4393..99cfd65 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, gawk, libidn, netperf,
-	openssl, php, qt, sqlite, tn5250, usbutils
+	Updated/fixed packages: cdrkit, gawk, iptables, libidn,
+	netperf, openssl, php, qt, sqlite, tn5250, usbutils
 
 	Removed packages: modutils
 
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 3e847d2..8e2ebc4 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -6,6 +6,7 @@
 IPTABLES_VERSION = 1.4.8
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
+IPTABLES_DEPENDENCIES = host-pkg-config
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 ifneq ($(BR2_INET_IPV6),y)
-- 
1.6.3.3
