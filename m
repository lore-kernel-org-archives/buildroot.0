From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:51:58 +0100
Subject: [Buildroot] [git commit] netsnmp: do not force --disable-static
Message-ID: <20131225170138.CB5D59C1D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=622bd71e0a26755e8bec37e835524e0a82a50884
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following patch enables the generation of static libraries
additionally to the shared ones for the netsnmp package.

[Thomas: fixed commit log.]

Signed-off-by: Andreas Ehmanns <universeii@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/netsnmp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6ab754e..47c6424 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,7 +11,7 @@ NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
-NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
+NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp \
 		--with-defaults --enable-mini-agent --without-rpm \
 		--with-logfile=none --without-kmem-usage $(DISABLE_IPV6) \
 		--enable-as-needed --without-perl-modules \
