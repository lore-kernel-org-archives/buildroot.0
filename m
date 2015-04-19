From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:44 +0200
Subject: [Buildroot] [git commit] package/perl-netaddr-ip: New package
Message-ID: <20150419114640.09D667FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7263ad4b72e503df782781ad77bbf6d77ecff7e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/perl-netaddr-ip/Config.in            |   10 ++++++++++
 package/perl-netaddr-ip/perl-netaddr-ip.hash |    3 +++
 package/perl-netaddr-ip/perl-netaddr-ip.mk   |   16 ++++++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6f79bb5..1f9c908 100644
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
index 0000000..4f082f1
--- /dev/null
+++ b/package/perl-netaddr-ip/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_NETADDR_IP
+	bool "perl-netaddr-ip"
+	depends on !BR2_STATIC_LIBS
+	help
+	  NetAddr::IP - Manages IPv4 and IPv6 addresses and subnets
+
+	  https://metacpan.org/release/NetAddr-IP
+
+comment "perl-netaddr-ip needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
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
index 0000000..e8ace9d
--- /dev/null
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -0,0 +1,16 @@
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
