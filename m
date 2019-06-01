From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:10:25 +0200
Subject: [Buildroot] [git commit] package/network-manager: drop
 --disable-ifnet
Message-ID: <20190601131045.C829E817BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc3e4dbae412012af653cddb32e912c8a9b7839d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ifnet has been drop since version 1.12.0 and
https://github.com/NetworkManager/NetworkManager/commit/0474441e2258eeecb356e2aa3cde5c7328828646

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
