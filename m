From: heiko at zuerker.org <heiko@zuerker.org>
Date: Mon, 25 Apr 2011 08:13:58 -0500
Subject: [Buildroot] [PATCH] dhcp: allow IPv6 to be turned on
Message-ID: <81ebf8aea6ba292691dea94445941fb6418e8c67.1303737183.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/dhcp/dhcp.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 64472c9..e647ef5 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -13,8 +13,11 @@ DHCP_CONF_OPT = \
 	--with-cli-lease-file=/var/lib/dhcp/dhclient.leases \
 	--with-srv-pid-file=/var/run/dhcpd.pid \
 	--with-cli-pid-file=/var/run/dhclient.pid \
-	--with-relay-pid-file=/var/run/dhcrelay.pid \
-	--disable-dhcpv6
+	--with-relay-pid-file=/var/run/dhcrelay.pid 
+
+ifneq ($(BR2_INET_IPV6),y)
+        DHCP_CONF_OPT += --disable-dhcpv6
+endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
 define DHCP_INSTALL_SERVER
-- 
1.7.3.2
