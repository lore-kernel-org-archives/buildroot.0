From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:17 +0200
Subject: [Buildroot] [PATCH 04/20] perl-netaddr-ip: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                            |    1 +
 package/perl-netaddr-ip/Config.in            |    6 ++++++
 package/perl-netaddr-ip/perl-netaddr-ip.hash |    3 +++
 package/perl-netaddr-ip/perl-netaddr-ip.mk   |   17 +++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-netaddr-ip/Config.in
 create mode 100644 package/perl-netaddr-ip/perl-netaddr-ip.hash
 create mode 100644 package/perl-netaddr-ip/perl-netaddr-ip.mk

diff --git a/package/Config.in b/package/Config.in
index ab4cf10..95f3624 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -514,6 +514,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
+	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-xml-libxml/Config.in"
diff --git a/package/perl-netaddr-ip/Config.in b/package/perl-netaddr-ip/Config.in
new file mode 100644
index 0000000..76c6611
--- /dev/null
+++ b/package/perl-netaddr-ip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_NETADDR_IP
+	bool "perl-netaddr-ip"
+	help
+	  NetAddr::IP - Manages IPv4 and IPv6 addresses and subnets
+
+	  http://search.cpan.org/~miker/NetAddr-IP-4.075/IP.pm
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.hash b/package/perl-netaddr-ip/perl-netaddr-ip.hash
new file mode 100644
index 0000000..37d17fa
--- /dev/null
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b72b91ebd228b096fd3b0acc87df877e NetAddr-IP-4.075.tar.gz
+sha256 ab8275bb8f306f780cd029a6dc48764461f4d1ef3a106b99fe5a90cbf2968839 NetAddr-IP-4.075.tar.gz
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
new file mode 100644
index 0000000..aaa3ef0
--- /dev/null
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# perl-netaddr-ip
+#
+################################################################################
+
+PERL_NETADDR_IP_VERSION = 4.075
+PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
+PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
+PERL_NETADDR_IP_DEPENDENCIES = perl
+PERL_NETADDR_IP_LICENSE = Artistic or GPLv1+
+PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
+
+PERL_NETADDR_IP_CONF_OPTS = -noxs
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.10.4
