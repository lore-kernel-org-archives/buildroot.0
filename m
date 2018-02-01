From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  2 Feb 2018 00:45:16 +0100
Subject: [Buildroot] [PATCH v2 2/2] network-manager: Add option OpenVSwitch
 support
In-Reply-To: <20180201234516.5031-1-petr.vorel@gmail.com>
References: <20180201234516.5031-1-petr.vorel@gmail.com>
Message-ID: <20180201234516.5031-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/network-manager/Config.in          | 6 ++++++
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 37e9b2fd8c..72658c1278 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -56,6 +56,12 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 comment "pppd support needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_NETWORK_MANAGER_OVS
+	bool "OpenVSwitch support"
+	select BR2_PACKAGE_JANSSON
+	help
+	  This option enables support for OpenVSwitch
+
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, dynamic library"
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 96e5a0b707..a520aad9c0 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -75,7 +75,7 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
-ifeq ($(BR2_PACKAGE_JANSSON),y)
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
 NETWORK_MANAGER_CONF_OPTS += --enable-ovs
 NETWORK_MANAGER_DEPENDENCIES += jansson
 else
-- 
2.16.1
