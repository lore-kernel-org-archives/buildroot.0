From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2015 23:20:48 +0100
Subject: [Buildroot] [git commit] dhcp: S80dhcp-server: also source
	/etc/default/dhcpd.conf for INTERFACES
Message-ID: <20151109222528.AA5878082E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5eb54fc0950825664824aa4ef100036efd3b5be6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for dhcpd.service. The file should really have been
named /etc/default/dhcpd instead, but changing it now would break existing
systemd setups so leave it as it is.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/S80dhcp-server |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 3df14ff..356e735 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -7,6 +7,9 @@
 #       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
 INTERFACES=""
 
+# Allow a few customizations from a config file
+test -r /etc/default/dhcpd.conf && . /etc/default/dhcpd.conf
+
 # Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
 test -f /etc/dhcp/dhcpd.conf || exit 0
