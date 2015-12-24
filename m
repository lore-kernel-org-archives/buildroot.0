From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:01:33 +0100
Subject: [Buildroot] [git commit] package/dhcp: systemd: support extra
	options
Message-ID: <20151224140139.A6B6C826F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b998c876c32e6ea7d15a10544db02ecb9e700183
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an OPTIONS configuration variable in order to make it possible to
pass custom extra options to dhcpd. This keeps the systemd support
consistent with the SysV init script.

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Reviewed-by:  "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcpd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
index a05deb8..98cc54b 100644
--- a/package/dhcp/dhcpd.service
+++ b/package/dhcp/dhcpd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/dhcpd.pid
-ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
+ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $OPTIONS $INTERFACES
 KillSignal=SIGINT
 EnvironmentFile=-/etc/default/dhcpd
 
