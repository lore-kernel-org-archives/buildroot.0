From: Valentine Barshak <gvaxon@gmail.com>
Date: Sun, 30 Sep 2012 22:11:04 +0400
Subject: [Buildroot] [PATCH] openvpn: Fix paths to external utilities
Message-ID: <20120930181104.GA2046@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets paths to ifconfig, route, netstat and ip
in the target root filesystem.

Otherwise the paths leak from the host and may not
match those on the target.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/openvpn/openvpn.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 03eabcf..b7e13f5 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -6,7 +6,11 @@
 
 OPENVPN_VERSION = 2.2.2
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_CONF_OPT = --enable-small --disable-plugins
+OPENVPN_CONF_OPT = --enable-small --disable-plugins \
+			--with-ifconfig-path=/sbin/ifconfig \
+			--with-route-path=/sbin/route \
+			--with-netstat-path=/bin/netstat \
+			--with-iproute-path=/bin/ip
 
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
 	OPENVPN_DEPENDENCIES += lzo
-- 
1.7.11.4
