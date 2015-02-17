From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 17 Feb 2015 16:42:11 +0100
Subject: [Buildroot] [PATCH] netsnmp: Set ac_cv_NETSNMP_CAN_USE_SYSCTL to no
Message-ID: <1424187731-417-1-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NETSNMP_CAN_USE_SYSCTL is for BSD systems, setting it to yes on
Linux systems breaks compilation when the mibII mib is enabled.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/netsnmp/netsnmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index bfc2a74..f1b103e 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -10,7 +10,7 @@ NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
-NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
+NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=no
 NETSNMP_CONF_OPTS = \
 	--with-persistent-directory=/var/lib/snmp \
 	--with-defaults \
-- 
1.9.3
