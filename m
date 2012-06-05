From: Marek Belisko <marek.belisko@gmail.com>
Date: Tue,  5 Jun 2012 22:22:57 +0200
Subject: [Buildroot] [Buildroot patch] Add package nss-mdns.
Message-ID: <1338927777-10637-1-git-send-email-marek.belisko@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@gmail.com>
---
 package/Config.in            |    1 +
 package/nss-mdns/Config.in   |   11 +++++++++++
 package/nss-mdns/nss-mdns.mk |   10 ++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/nss-mdns/Config.in
 create mode 100644 package/nss-mdns/nss-mdns.mk

diff --git a/package/Config.in b/package/Config.in
index dde5800..e9c8a6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -419,6 +419,7 @@ source "package/libsoup/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
+source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
 source "package/zeromq/Config.in"
 endmenu
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
new file mode 100644
index 0000000..7a17b4e
--- /dev/null
+++ b/package/nss-mdns/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NSS_MDNS
+	bool "nss-mdns"
+	help
+	  nss-mdns is a plugin for the GNU Name Service Switch (NSS)
+	  functionality of the GNU C Library (glibc) providing host
+	  name resolution via Multicast DNS (aka Zeroconf, aka Apple
+	  Rendezvous, aka Apple Bonjour), effectively allowing name
+	  resolution by common Unix/Linux programs in the ad-hoc
+	  mDNS domain .local.
+
+	  http://0pointer.de/lennart/projects/nss-mdns/
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
new file mode 100644
index 0000000..a0d80d1
--- /dev/null
+++ b/package/nss-mdns/nss-mdns.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# nss_mdns
+#
+#############################################################
+NSS_MDNS_VERSION:=0.10
+NSS_MDNS_SOURCE:=nss-mdns-$(NSS_MDNS_VERSION).tar.gz
+NSS_MDNS_SITE:=http://0pointer.de/lennart/projects/nss-mdns
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.10.2
