From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:35:59 +0100
Subject: [Buildroot] [git commit] netsnmp: add explicit support for pciutils
Message-ID: <20151215203617.D7D4B81DBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83124e7dd6355f39edadee06b6179b8f0acc2e63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by Lonnie Abelbeck via email.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
