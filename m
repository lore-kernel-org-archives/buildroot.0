From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Jun 2019 12:53:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/network-manager: drop
 --disable-ifnet
Message-ID: <20190601105351.21675-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ifnet has been drop since version 1.12.0 and
https://github.com/NetworkManager/NetworkManager/commit/0474441e2258eeecb356e2aa3cde5c7328828646

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/network-manager/network-manager.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c0a9ba0bdb..4ed89231fb 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -29,8 +29,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--without-docs \
 	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
-	--disable-ifupdown \
-	--disable-ifnet
+	--disable-ifupdown
 
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
-- 
2.20.1
