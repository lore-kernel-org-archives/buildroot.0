From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:22 +0100
Subject: [Buildroot] [PATCH 01/15] packages/dhcp: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-2-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for dhcp is added by the services/networkmanager module in the
SELinux repolicy.

Add this information so that dhcp can be used when SELinux is enabled on
the system.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/dhcp/dhcp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index ad59804d3b..e5d7fb9b90 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -10,6 +10,7 @@ DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
 DHCP_DEPENDENCIES = bind
+DHCP_SELINUX_MODULES = networkmanager
 
 # use libtool-enabled configure.ac
 define DHCP_LIBTOOL_AUTORECONF
-- 
2.25.4
