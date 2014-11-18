From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 14:01:57 -0300
Subject: [Buildroot] [PATCH 9/9] network-manager: adjust dhclient and dhcpcd
	directories
In-Reply-To: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1416330117-4458-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhclient and dhcpcd were moved from /usr/sbin to /sbin for busybox-less
SysV-style init with Debian utilities, so adjust accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/network-manager/network-manager.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.0.4
