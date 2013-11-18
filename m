From: universe II <universeii@gmx.de>
Date: Mon, 18 Nov 2013 16:02:18 +0100
Subject: [Buildroot] [PATCH] Enabling static libraries build for netsnmp
	package
Message-ID: <528A2BFA.4040102@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As many embedded SW systems do no allow usage of shared libraries, I was 
wondering why the netsnmp package creates shared libraries only. The 
following patch enables the generation of static libraries additionally 
to the shared ones.

Regards,
Andreas


signed-off-by Andreas Ehmanns <universeii@gmx.de>

diff -purN netsnmp_orig/netsnmp.mk netsnmp/netsnmp.mk
--- netsnmp_orig/netsnmp.mk     2013-09-17 13:42:07.000000000 +0200
+++ netsnmp/netsnmp.mk  2013-11-18 15:50:56.744217078 +0100
@@ -11,7 +11,7 @@ NETSNMP_LICENSE = Various BSD-like
  NETSNMP_LICENSE_FILES = COPYING
  NETSNMP_INSTALL_STAGING = YES
  NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
-NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp 
--disable-static \
+NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp \
                 --with-defaults --enable-mini-agent --without-rpm \
                 --with-logfile=none --without-kmem-usage $(DISABLE_IPV6) \
                 --enable-as-needed --without-perl-modules \
