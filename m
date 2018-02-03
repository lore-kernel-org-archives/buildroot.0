From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 23:22:20 +0100
Subject: [Buildroot] [git commit] network-manager: Bump to version 1.10.2
Message-ID: <20180203222531.697C788314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d4076caec4216e78af628ddbc01598a909b4ae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

handle new dependency to Jansson (since 1.10.0).

[Peter: unconditionally disable ovs support as suggested by Thomas]
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 3262ad3b00..8fedc64729 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.8/NetworkManager-1.8.4.sha256sum
-sha256 625e2eb36386dcae599075226200140d010f213b47f7202d83b3b1a202029212  NetworkManager-1.8.4.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.10/NetworkManager-1.10.2.sha256sum
+sha256 169c34f50770e3c96b431f7d2cff654455246f2e6ccd46eccfb4454d4595625b  NetworkManager-1.10.2.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index caf462e26e..ccf376d0d8 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.8
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
+NETWORK_MANAGER_VERSION_MAJOR = 1.10
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -30,7 +30,8 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
 	--disable-ifupdown \
-	--disable-ifnet
+	--disable-ifnet \
+	--disable-ovs
 
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
