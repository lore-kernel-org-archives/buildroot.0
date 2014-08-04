From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 21:31:54 +0200
Subject: [Buildroot] [git commit] dhcp: Fix IPv6 files paths
Message-ID: <20140804193328.0C0F49D3A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cf81c01b34f37152fa8bb47d2a7c532e4791610
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use IPv6 file locations consistent with those set for IPv4 instead of keeping
the defaults, which use different locations.

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

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
