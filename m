From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon,  4 Aug 2014 20:19:04 +0200
Subject: [Buildroot] [PATCH 2/2] dhcp: Fix IPv6 files paths
In-Reply-To: <1407176344-13291-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407176344-13291-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <1407176344-13291-2-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use IPv6 file locations consistent with those set for IPv4 instead of keeping
the defaults, which use different locations.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/dhcp/dhcp.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 32dbea0..464ed56 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -16,10 +16,15 @@ DHCP_CONF_ENV = \
 DHCP_CONF_OPT = \
 	--localstatedir=/var/lib/dhcp \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
+	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
 	--with-cli-lease-file=/var/lib/dhcp/dhclient.leases \
+	--with-cli6-lease-file=/var/lib/dhcp/dhclient6.leases \
 	--with-srv-pid-file=/var/run/dhcpd.pid \
+	--with-srv6-pid-file=/var/run/dhcpd6.pid \
 	--with-cli-pid-file=/var/run/dhclient.pid \
-	--with-relay-pid-file=/var/run/dhcrelay.pid
+	--with-cli6-pid-file=/var/run/dhclient6.pid \
+	--with-relay-pid-file=/var/run/dhcrelay.pid \
+	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
         DHCP_CONF_OPT += --enable-delayed-ack
-- 
1.9.1
