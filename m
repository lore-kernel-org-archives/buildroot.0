From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 23:15:58 +0100
Subject: [Buildroot] [git commit] network-manager: adjust dhclient and
	dhcpcd directories
Message-ID: <20141201104837.176EB7FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4859f979b2394086761260071049b1ee6419d4ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dhclient and dhcpcd were moved from /usr/sbin to /sbin for busybox-less
SysV-style init with Debian utilities, so adjust accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/network-manager.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 7944254..9770cae 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -56,11 +56,11 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/usr/sbin/dhclient
+NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
 endif
 
 ifeq ($(BR2_PACKAGE_DHCPCD),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/usr/sbin/dhcpcd
+NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
 # uClibc by default doesn't have backtrace support, so don't use it
