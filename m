From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:40:18 +0200
Subject: [Buildroot] [git commit] net-snmp: needs mmu
Message-ID: <20131009214150.06FA79B9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e8f1ff34402abec22e9ed300c691a79cd211dbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/Config.in |    1 +
 package/quagga/Config.in  |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index d94abb7..3d08936 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
 	  SNMP v3 using both IPv4 and IPv6.
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index c364ae1..90eaef4 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -80,6 +80,7 @@ config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
 
 config BR2_PACKAGE_QUAGGA_SNMP
 	bool "SNMP support"
+	depends on BR2_USE_MMU # net-snmp
 	select BR2_PACKAGE_NETSNMP
 	help
 	  Make quagga information available via SNMP SMUX.
