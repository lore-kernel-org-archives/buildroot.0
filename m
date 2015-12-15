From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Dec 2015 14:20:18 -0300
Subject: [Buildroot] [PATCH] netsnmp: add explicit support for pciutils
Message-ID: <1450200018-9984-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by Lonnie Abelbeck via email.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netsnmp/netsnmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index fb72179..0eb3b26 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -62,6 +62,11 @@ else
 NETSNMP_CONF_OPTS += --without-openssl
 endif
 
+# There's no option to forcibly enable or disable it
+ifeq ($(BR2_PACKAGE_PCIUTILS),y)
+NETSNMP_DEPENDENCIES += pciutils
+endif
+
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
 NETSNMP_CONF_OPTS += --disable-mib-loading
 NETSNMP_CONF_OPTS += --disable-mibs
-- 
2.4.10
